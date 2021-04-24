class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options null: false do
    validates :product
    validates :product_description 
    validates :price
  end
  validates :user,foreign_key: true
end
