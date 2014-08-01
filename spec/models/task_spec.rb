require 'spec_helper'

describe Task do
  before(:each) do
    @t = FactoryGirl.build(:task)
  end

  it "has a valid factory" do
    expect(@t).to be_valid
  end
end