require 'rails_helper'

RSpec.describe Boards::BoardDestroyer do
  let(:board) { instance_double('Board') }
  subject(:destroyer) { described_class.new }
  
  describe '#call' do
    context 'when destroy is successful' do
      it 'deletes a board and mark successful true' do
        expect(board).to receive(:destroy).and_return(true)
        result = destroyer.call(board: board)
        expect(result.successful?).to be true
      end
    end
    
    context 'when destroy fails' do
      it 'marks successful false' do
        expect(board).to receive(:destroy).and_return(false)
        result = destroyer.call(board: board)
        expect(result.successful?).to be false
      end
    end
  end
end