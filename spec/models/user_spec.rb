#require 'rails_helper'
require 'spec_helper'

describe User do
  before(:each) do
    @u = FactoryGirl.build(:user)
  end

  it "has a valid factory" do
    expect(@u).to be_valid
  end
end