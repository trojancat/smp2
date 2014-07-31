# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    subject { Faker::Lorem.characters(rand(4..30)) }
    message { Faker::Lorem.paragraph }
    status 1

    association :sender, factory: :user
    association :acceptor, factory: :user
  end
end