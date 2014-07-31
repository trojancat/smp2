# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(char_count = rand(10..20)) }
    name { Faker::Name.name }
    role { rand(1..3) }

  end
end