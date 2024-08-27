require 'faker'
FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Faker::Japanese::Name.first_name}
    last_name             {Faker::Japanese::Name.last_name}
    first_kana            {Faker::Japanese::Name.first_name.yomi}
    last_kana             {Faker::Japanese::Name.last_name.yomi}
    birth_date            {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
