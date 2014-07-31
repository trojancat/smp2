# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting_entry do
    message { Faker::Lorem.characters(rand(4..30)) }

    association :meeting, factory: :meeting
    association :owner, factory: :user
  end
end