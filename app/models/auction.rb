class Auction < ApplicationRecord
  belongs_to :pet
  belongs_to :pet_owner, class_name: 'User', foreign_key: 'pet_owner_id'
  belongs_to :bidder, class_name: 'User', foreign_key: 'bidder_id'
end
