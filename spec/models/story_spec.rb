require 'rails_helper'

RSpec.describe Story, type: :model do
  let(:story) { FactoryBot.build(:story) }

  it { should belong_to(:column).without_validating_presence }

  it "is valid with valid attributes" do
    expect(story).to be_valid
  end

  it "is not valid without a title" do
    story.title = nil
    expect(story).not_to be_valid
  end

  it "is not valid without an order" do
    story.order = nil
    expect(story).not_to be_valid
  end
end
