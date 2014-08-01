require 'spec_helper'

describe Message do
  before(:each) do
    @m = FactoryGirl.build(:message)
  end

  it "has a valid factory" do
    expect(@m).to be_valid
  end
end