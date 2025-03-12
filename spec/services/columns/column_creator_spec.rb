require 'rails_helper'

RSpec.describe Columns::ColumnCreator do
  let(:board) { instance_double('Board') }
  let(:column) { instance_double('Column') }
  let(:params) {{ title: 'Test Column Title' }}

  subject(:validator) { instance_double(Columns::ColumnValidator) }
  subject(:creator) { described_class.new(validator_service: validator) }

  before do
    allow(Column).to receive(:new).with(params).and_return(column)
    allow(column).to receive(:board=).with(board)
  end
  
  describe '#call' do
    context 'when validation is successful' do
      it 'creates a column and marks successful true' do
        allow(validator).to receive(:call).with(column: column).and_return(double(successful?: true))
        
        expect(column).to receive(:save).and_return(true)
        result = creator.call(board: board, params: params)
        expect(result.successful?).to be true
      end
    end

    context 'when validation fails' do
      it 'does not create a column and mark successful false' do
        allow(validator).to receive(:call).with(column: column).and_return(double(successful?: false))

        expect(column).not_to receive(:save)
        result = creator.call(board: board, params: params)
        expect(result.successful?).to be false
      end
    end

    context 'when saving fails' do
      it 'marks successful false' do
        allow(validator).to receive(:call).with(column: column).and_return(double(successful?: false))
        allow(column).to receive(:save).and_return(false)

        result = creator.call(board: board, params: params)
        expect(result.successful?).to be false
      end
    end
  end
end