class Pet < ApplicationRecord
  belongs_to :category
  belongs_to :tag
  belongs_to :user
end
