require 'rails_helper'

RSpec.describe Columns::ColumnDestroyer do
  let(:column) { instance_double('Column') }
  subject(:destroyer) { described_class.new }

  describe '#call' do
    context 'when destroy is successful' do
      it 'deletes a column and mark successful true' do
        expect(column).to receive(:destroy).and_return(true)
        result = destroyer.call(column: column)
        expect(result.successful?).to be true
      end
    end

    context 'when destroy fails' do
      it 'marks successful false' do
        expect(column).to receive(:destroy).and_return(false)
        result = destroyer.call(column: column)
        expect(result.successful?).to be false
      end
    end
  end
end
