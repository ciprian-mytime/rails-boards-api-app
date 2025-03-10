require 'rails_helper'

RSpec.describe Board, type: :model do
  let(:board) { FactoryBot.build(:board) }

  context 'Should validate' do
    it 'with title present' do
      expect(board).to be_valid
    end
  end

  context 'Should not be valid' do
    it 'when title is not present' do
      board.title = nil
      expect(board).not_to be_valid
    end
  end
end
