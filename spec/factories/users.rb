FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    family_name           { '田中' }
    first_name            { '田中' }
    family_name_kana      { 'タナカ' }
    first_name_kana       { 'タナカ' }
    email                 {Faker::Internet.free_email}
    password             { '1a' + Faker::Internet.password(min_length: 7, max_length: 20) }

    # nickname              {Faker::Name.initials(number: 2)}
    # family_name           {Faker::Name.initials(number: 2)}
    # first_name            {Faker::Name.initials(number: 2)}
    # family_name_kana      {Faker::Name.initials(number: 2)}
    # first_name_kana       {Faker::Name.initials(number: 2)}
    # email                 {Faker::Internet.free_email}
    # password              {Faker::Internet.password(min_length: 6)}
    # password_confirmation {password}
  end
end