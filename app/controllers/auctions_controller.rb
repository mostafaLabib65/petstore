# frozen_string_literal: true

class AuctionsController < ApplicationController
  def bid
    params = bid_params
    begin
      params['pet_owner_id'] = Pet.find(params['pet_id']).user.id
    rescue StandardError => e
      # ignored
    end
    bid = Auction.new(params)
    if bid.save
      render json: bid
    else
      render json: e, status: :unprocessable_entity
    end
  end

  def index
    ## In actual coding it won't happen like this(passing user_id in params)
    # if there was an authentication i would call current_user
    # It's like this just for the purpose of the assessment
    params = pid_owner_list_bis_params
    begin
    bids= Auction.where(pet_owner_id: params['user_id'])
    rescue StandardError => e
      bids = e
    end
    render json: bids
  end

  def earnings
    response = []
    params = earnings_params
    participants = params['participants']
    if participants.empty?
      render json: {
        message: 'No Winners'
      }
    elsif participants.length <= params['items'].to_i
      render json: {
        message: 'Error number of participants are less than or equal to number of items'
      }
    else

      (0..params['items'].to_i-1).each do |i|
        name = participants[i]['name']
        paid = participants[i+1]['amount']
        response.push(name: name, paid: paid)
      end
      (params['items'].to_i..participants.length-1).each do |i|
        name = participants[i]['name']
        response.push(name: name, paid: 'Lost')
      end
      render json: {
        message: response
      }
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:bidder_id, :pet_id, :amount_of_money)
  end

  def pid_owner_list_bis_params
    ## Actually it won't happen like this
    # if there was an authentication i would call current_user
    # It's like this just for the purpose of the assessment
    params.require(:user).permit(:user_id)
  end

  def earnings_params
    prepared_params = {}
    sorted_array = []
    parameters = params.permit(:items, participants: %i[name amount])
    begin
      parameters['participants'].each do |participant|
        sorted_array.push(participant.as_json)
      end
    rescue StandardError => e
      # ignored
    end
    sorted_array = sorted_array .sort do |a, b| 
      [a['amount'], b['name']] <=> [b['amount'], a['name']]
    end
    prepared_params['items'] = 0
    prepared_params['items'] = params['items'] if params['items']
    prepared_params['participants'] = sorted_array.reverse
    prepared_params
  end
end
