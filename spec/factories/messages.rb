# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    title { Faker::Lorem.characters(rand(4..30)) }
    body { Faker::Lorem.paragraph }
    status 1

    association :sender, factory: :user
    association :acceptor, factory: :user
  end
end