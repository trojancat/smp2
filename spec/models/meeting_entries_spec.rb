require 'spec_helper'

describe MeetingEntry do
  before(:each) do
    @me = FactoryGirl.build(:meeting_entry)
  end

  it "has a valid factory" do
    expect(@me).to be_valid
  end

  it { should belong_to(:owner).class_name(User) }
  it { should belong_to(:meeting).class_name(Meeting) }
  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:meeting) }
end
