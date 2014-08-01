# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    title { Faker::Lorem.characters(rand(4..30)) }
    description { Faker::Lorem.paragraph }
    status 1

    association :owner, factory: :user
  end
end