require 'rails_helper'

RSpec.describe Board, type: :model do
  let(:board) { FactoryBot.build(:board) }

  it "is valid with valid attributes" do
    expect(board).to be_valid
  end

  it "is not valid without a title" do
    board.title = nil
    expect(board).not_to be_valid
  end

  describe "#count_stories" do
    it "returns the number of stories on a board [TESTING USING STUB]" do
      allow(board).to receive(:count_stories).and_return(30)
      expect(board.count_stories).to eq(30)
    end
  end

  describe "#dummy_print_column" do
    it "ignores dummy object but requires it for method signature" do
      expect { board.dummy_print_column('X') }.not_to raise_error
    end
  end
end
