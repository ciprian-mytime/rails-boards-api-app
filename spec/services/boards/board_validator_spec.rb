require 'rails_helper'

RSpec.describe Boards::BoardValidator do
  let(:board) { instance_double('Board', title: title, errors: instance_double('ActiveModel::Errors', add: nil)) }
  subject(:validator) { described_class.new }

  describe '#call' do
    context 'when board has a title' do
      let(:title) { 'Sample Board' }

      it 'does not add errors' do
        validator.call(board: board)
        expect(validator.errors).to be_empty
      end
    end

    context 'when board has no title' do
      let(:title) { nil }

      it 'adds an error message' do
        allow(I18n).to receive(:t).with('errors.board.title_must_be_present').and_return('Title must be present')

        validator.call(board: board)
        
        expect(validator.errors).to include('Title must be present')
        expect(board.errors).to have_received(:add).with(:general, 'Title must be present')
      end
    end
  end

  describe '#successful?' do
    context 'when there are no errors' do
      let(:title) { 'Valid Title' }

      it 'returns true' do
        validator.call(board: board)
        expect(validator.successful?).to be true
      end
    end

    context 'when there are errors' do
      let(:title) { nil }

      it 'returns false' do
        validator.call(board: board)
        expect(validator.successful?).to be false
      end
    end
  end
end