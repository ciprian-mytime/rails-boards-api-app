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
end
