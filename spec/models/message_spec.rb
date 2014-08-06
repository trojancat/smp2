require 'spec_helper'

describe Message do
  before(:each) do
    @m = FactoryGirl.build(:message)
  end

  it "has a valid factory" do
    expect(@m).to be_valid
  end

  it { should belong_to(:sender).class_name(User) }
  it { should belong_to(:acceptor).class_name(User) }
  it { should ensure_length_of(:title).is_at_most(255) }
  it { should validate_presence_of(:sender) }
  it { should validate_presence_of(:acceptor) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should ensure_inclusion_of(:status).in_array(Message::status.values) }
end