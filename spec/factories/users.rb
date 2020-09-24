FactoryBot.define do
  factory :user do
    nickname              {""}
    family_name           {""}
    first_name            {""}
    family_name_kana      {""}
    first_name_kana       {""}
    email                 {"kkk@gmail.com"}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end