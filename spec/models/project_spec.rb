require 'spec_helper'

describe Project do
  before(:each) do
    @p = FactoryGirl.build(:project)
  end

  it "has a valid factory" do
    expect(@p).to be_valid
  end
end