class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.bigint :bidder_id
      t.bigint :pet_owner_id
      t.belongs_to :pet
      t.integer :amount_of_money

      t.timestamps
    end
    add_foreign_key :auctions, :users, column: :pet_owner_id
    add_foreign_key :auctions, :users, column: :bidder_id
  end
end
