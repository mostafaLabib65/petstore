# frozen_string_literal: true

require 'rails_helper'
require 'rake'

RSpec.describe AuctionsController, type: :controller do
  describe 'Posting bids and getting them with valid data' do
    context 'Passing user id' do
      let(:params) do
        {
          user: { user_id: 1 }
        }
      end
      before do
        5.times do
          post 'bid', params:
              {
                bid:
                  {
                    bidder_id: '1',
                    pet_id: '2',
                    amount_of_money: '200'
                  }
              }
        end
        get 'index', params: params
      end

      it 'returns ok status and array of created bids' do
        expect(response).to have_http_status :ok
        expect(JSON.parse(response.body).length).to eq 5
      end
    end
  end

  describe 'Post #bid with invalid data' do
    context 'Passing pet_id not existing' do
      before do
        post 'bid', params:
              {
                bid:
                  {
                    bidder_id: '1',
                    pet_id: '100',
                    amount_of_money: '200'
                  }
              }
      end

      it 'returns 404 status' do
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'get earnings' do
    context 'Passing No bidders' do
      before do
        get 'earnings', params: {items: 3}
      end

      it 'Returns No winners message' do
        expect(JSON.parse(response.body)['message']).to eq 'No Winners'
      end
    end

    context 'Passing bidders less than Items' do
      before do
        get 'earnings', params:
            {
              items: 3,
              participants: [
                { name: 'John Doe', amount: '100' },
                { name: 'John Smith', amount: '500' },
                { name: 'Sara Conor', amount: '280' }
              ]
            }
      end

      it 'Returns No winners message' do
        expect(JSON.parse(response.body)['message']).to eq 'Error number of participants are less than or equal to number of items'
      end
    end

    context 'Passing Correct data' do
      let(:result) do
        [
          {
            'name'=> 'John Smith',
            "paid"=> '320'
          },
          {
            "name"=> 'Martin Fowler',
            "paid"=> '280'
          },
          {
            "name"=> 'Sara Conor',
            "paid"=> '100'
          },
          {
            "name"=> 'John Doe',
            "paid"=> 'Lost'
          }
        ]
      end
      before do
        get 'earnings', params:
            {
              items: 3,
              participants: [
                { name: 'John Doe', amount: '100' },
                { name: 'John Smith', amount: '500' },
                { name: 'Sara Conor', amount: '280' },
                { name: 'Martin Fowler', amount: '320' }
              ]
            }
      end

      it 'Returns No winners message' do
        expect(JSON.parse(response.body)['message'].length).to eq 4
        expect(JSON.parse(response.body)['message']).to eq result
      end
    end
  end
end
