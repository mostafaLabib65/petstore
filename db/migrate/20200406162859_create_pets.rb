class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :status
      t.belongs_to  :category
      t.belongs_to  :tag
      t.belongs_to  :user

      t.timestamps
    end
    add_foreign_key :pets, :categories
    add_foreign_key :pets, :tags
    add_foreign_key :pets, :users
  end
end