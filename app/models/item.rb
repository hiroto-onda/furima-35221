class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_state
  belongs_to :delivery_charge_burden
  belongs_to :regional_original_delivery
  belongs_to :days_up_to_delivery

  with_options presence: true do
    validates :product
    validates :product_description
    validates :price
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_state_id
    validates :delivery_charge_burden_id
    validates :regional_original_delivery_id
    validates :days_up_to_delivery_id
  end
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
end
