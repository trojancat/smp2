# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting_entry, :class => 'MeetingEntries' do
    message "MyText"
  end
end
