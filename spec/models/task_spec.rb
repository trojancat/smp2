require 'spec_helper'

describe Task do
  before(:each) do
    @t = FactoryGirl.build(:task)
  end

  it "has a valid factory" do
    expect(@t).to be_valid
  end

  it { should belong_to(:owner).class_name(User) }
  it { should belong_to(:project).class_name(Project) }
  it { should ensure_length_of(:title).is_at_most(255) }
  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:project) }
  it { should validate_presence_of(:title) }
  it { should ensure_inclusion_of(:status).in_array(Task::status.values) }
end