FactoryBot.define do
  factory :order_form do
    token            {"tok_abcdefghijk00000000000000000"}
    postal_code      {'111-1111'}
    prefecture       { Faker::Number.between(from: 2, to: 47) }
    address          {'世田谷1-1-1'}
    building_name    {'東京ビル'}
    phone_number     { Faker::PhoneNumber.cellphone }
    munisicipality   {'横浜市青葉区'}
  end
end