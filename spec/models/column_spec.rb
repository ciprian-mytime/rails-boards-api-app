require 'rails_helper'

RSpec.describe Column, type: :model do
  let(:column) { FactoryBot.build(:column) }

  it { should belong_to(:board).without_validating_presence }

  it "is valid with valid attributes" do
    expect(column).to be_valid
  end

  it "is not valid without a title" do
    column.title = nil
    expect(column).not_to be_valid
  end

  it "is not valid without an order" do
    column.order = nil
    expect(column).not_to be_valid
  end

  describe "#move_up" do
    it "moves the column up(left) by reducing order by 1 [TESTED WITH SPY]" do
      allow(column).to receive(:move_up)

      column.move_up
      expect(column).to have_received(:move_up)
    end

    it "moves the column up(left) by reducing order by 1 [TESTED WITH MOCK]" do
      expect(column).to receive(:move_up)
      column.move_up
    end
  end

  describe "#move_down" do
    it "moves the column down(right) by increasing order by 1 [TESTED WITH SPY]" do
      allow(column).to receive(:move_down)

      column.move_down
      expect(column).to have_received(:move_down)
    end

    it "moves the column down(right) by increasing order by 1 [TESTED WITH MOCK]" do
      expect(column).to receive(:move_down)
      column.move_down
    end
  end
end
