# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting do
    title { Faker::Lorem.characters(rand(4..30)) }
    status 'открыт'

    association :project, factory: :project
    association :owner, factory: :user
  end
end