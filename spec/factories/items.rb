FactoryBot.define do
  factory :item do
    product{'商品名'}
    product_description{'商品の説明'}
    category_id {2}
    product_state_id {2}
    delivery_charge_burden_id {2}
    regional_original_delivery_id {2}
    days_up_to_delivery_id {2}
    price{300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
