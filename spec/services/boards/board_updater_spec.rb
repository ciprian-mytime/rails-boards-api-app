require 'rails_helper'

RSpec.describe Boards::BoardUpdater do
  let(:board) { instance_double('Board') }
  let(:params) {{ title: 'UPDATED Test Board Title' }}

  subject(:updater) { described_class.new }

  describe '#call' do
    context 'when update is successful' do
      it 'updates a board and mark successful true' do
        expect(board).to receive(:update!).and_return(true)
        result = updater.call(board: board, params: params)
        expect(result.successful?).to be true
      end
    end

    context 'when update fails' do
      it 'marks successful false' do
        expect(board).to receive(:update!).and_return(false)
        result = updater.call(board: board, params: params)
        expect(result.successful?).to be false
      end
    end
  end
end