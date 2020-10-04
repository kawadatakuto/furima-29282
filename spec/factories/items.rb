FactoryBot.define do
  factory :item do
    title                 { '洋服' }
    text                  { 'オシャレ' }
    selling_price         { '10000' }
    genre_id              { Faker::Number.between(from:2, to: 10) }
    status_id             { Faker::Number.between(from:2, to: 7) }
    delivery_fee_id       { Faker::Number.between(from:2, to: 3) }
    delivery_area_id      { Faker::Number.between(from:2, to: 47) }
    delivery_time_id      { Faker::Number.between(from:2, to: 4) }
  end
end
