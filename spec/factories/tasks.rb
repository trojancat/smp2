# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title { Faker::Lorem.characters(rand(4..30)) }
    description { Faker::Lorem.paragraph }
    status  1

    association :project, factory: :project
    association :owner, factory: :user
  end
end