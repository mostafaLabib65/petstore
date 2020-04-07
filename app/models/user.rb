class User < ApplicationRecord
  has_many :pets
  has_many :pet_auction, class_name: 'Auction', foreign_key: 'pet_owner_id'
  has_many :auctions, class_name: 'Auction', foreign_key: 'bidder_id'
end
