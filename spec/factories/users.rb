FactoryBot.define do
  factory :user do
    nickname              {""}
    email                 {"kkk@gmail.com"}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end