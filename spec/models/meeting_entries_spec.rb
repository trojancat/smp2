require 'spec_helper'

describe MeetingEntry do
  before(:each) do
    @me = FactoryGirl.build(:meeting_entry)
  end

  it "has a valid factory" do
    expect(@me).to be_valid
  end
end
