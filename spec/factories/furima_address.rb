FactoryBot.define do
  factory :furima_address do
    postal_code { '123-4567' }
    regional_original_delivery_id { 1 }
    city { '旭川市' }
    house_number { '1-1' }
    building_name { '旭川市ハイツ' }
    phone_number { '09012341234' }
  end
end