require 'spec_helper'

describe Project do
  before(:each) do
    @p = FactoryGirl.build(:project)
  end

  it "has a valid factory" do
    expect(@p).to be_valid
  end

  it { should belong_to(:owner).class_name(User) }
  it { should ensure_length_of(:title).is_at_most(255) }
  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:title) }
  it { should ensure_inclusion_of(:status).in_array(Project::status.values) }
end