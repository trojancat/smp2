# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    title { Faker::Lorem.characters(rand(4..30)) }
    description { Faker::Lorem.paragraph }
    status 'открыт'

    association :owner, factory: :user
  end
end