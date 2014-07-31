require 'spec_helper'

describe Meeting do
  before(:each) do
    @m = FactoryGirl.build(:meeting)
  end

  it "has a valid factory" do
    expect(@m).to be_valid
  end
end
