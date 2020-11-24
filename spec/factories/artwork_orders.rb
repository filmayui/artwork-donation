FactoryBot.define do
  factory :artwork_order do

    postal_code { '000-0000' }
    prefecture_id { 1 }
    city { '東京' }
    addresses { '天空町' }
    building { 'タワー' }
    phone_number { '00000000000' }
    
  end
end
