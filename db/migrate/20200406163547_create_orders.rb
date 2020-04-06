class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :pet
      t.integer :quantity
      t.string :status
      t.date :shipDate
      t.boolean :complete

      t.timestamps
    end
    add_foreign_key :orders, :pets
  end
end
