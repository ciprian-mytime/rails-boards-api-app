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

  describe "#move_up" do
    it "moves the story up(left) by reducing order by 1 [TESTED WITH FAKE]" do
      story = FactoryBot.build(:story, order: 5)

      story.move_up
      expect(story.order).to eq(4)
    end
  end

  describe "#move_down" do
    it "moves the story down(right) by increasing order by 1 [TESTED WITH FAKE]" do
      story = FactoryBot.build(:story, order: 5)

      story.move_down
      expect(story.order).to eq(6)
    end
  end
end
