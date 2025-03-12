require 'rails_helper'

RSpec.describe Columns::ColumnUpdater do
  let(:column) { instance_double('Column') }
  let(:params) {{ title: 'UPDATED Test Column Title' }}

  subject(:updater) { described_class.new }

  describe '#call' do
    context 'when update is successful' do
      it 'updates a column and mark successful true' do
        expect(column).to receive(:update!).and_return(true)
        result = updater.call(column: column, params: params)
        expect(result.successful?).to be true
      end
    end

    context 'when update fails' do
      it 'marks successful false' do
        expect(column).to receive(:update!).and_return(false)
        result = updater.call(column: column, params: params)
        expect(result.successful?).to be false
      end
    end
  end
end