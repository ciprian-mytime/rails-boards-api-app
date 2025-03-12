require 'rails_helper'

RSpec.describe Boards::BoardCreator do
  let(:board) { instance_double('Board') }
  let(:params) {{ title: 'Test Board Title' }}

  subject(:validator) { instance_double(Boards::BoardValidator) }
  subject(:creator) { described_class.new(validator_service: validator) }

  before do
    allow(Board).to receive(:new).with(params).and_return(board)
  end
  
  describe '#call' do
    context 'when validation is successful' do
      it 'creates a board and marks successful true' do
        allow(validator).to receive(:call).with(board: board).and_return(double(successful?: true))
        
        expect(board).to receive(:save).and_return(true)
        result = creator.call(params: params)
        expect(result.successful?).to be true
      end
    end

    context 'when validation fails' do
      it 'does not create a board and mark successful false' do
        allow(validator).to receive(:call).with(board: board).and_return(double(successful?: false))

        expect(board).not_to receive(:save)
        result = creator.call(params: params)
        expect(result.successful?).to be false
      end
    end

    context 'when saving fails' do
      it 'marks successful false' do
        allow(validator).to receive(:call).with(board: board).and_return(double(successful?: false))
        allow(board).to receive(:save).and_return(false)

        result = creator.call(params: params)
        expect(result.successful?).to be false
      end
    end
  end
end