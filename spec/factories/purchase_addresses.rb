FactoryBot.define do
  factory :purchase_address do
    zip_code      { '123-4567' }
    area_id       { 2 }
    city          { '東京都' }
    address_line  { '1-1' }
    building_name { '東京ハイツ' }
    tell          { '09012345678' }
    association :user
    association :item
  end
end
