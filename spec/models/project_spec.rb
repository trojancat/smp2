require 'spec_helper'

describe Project do
  before(:each) do
    @p = FactoryGirl.build(:project)
  end

  it "has a valid factory" do
    expect(@p).to be_valid
  end

  it { is_expected.to belong_to(:owner).class_name(User) }
  it { is_expected.to ensure_length_of(:title).is_at_most(255) }
  it { is_expected.to validate_presence_of(:owner) }
  it { is_expected.to validate_presence_of(:title) }
  #it { is_expected.to validate_inclusion_of(:status).in_array([Project::OPENED, Project::CLOSED]) }
  it { is_expected.to validate_inclusion_of(:status).in_array([1, 2]) }
end