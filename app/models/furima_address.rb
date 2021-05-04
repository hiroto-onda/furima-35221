class FurimaAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :regional_original_delivery_id, :city, :house_number, :building_name, :phone_number, :purchase, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :regional_original_delivery_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    furima = Purchase.create(item_id: item_id, user_id: user_id)
    DeliveryAddress.create(postal_code: postal_code, regional_original_delivery_id: regional_original_delivery_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: furima.id)
  end
end

