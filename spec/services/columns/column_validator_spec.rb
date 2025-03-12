require 'rails_helper'

RSpec.describe Columns::ColumnValidator do
  let(:column) { instance_double('Column', title: title, board_id: board_id, order: order, errors: instance_double('ActiveModel::Errors', add: nil)) }
  subject(:validator) { described_class.new }

  describe '#call' do
    context 'when column has title, assiciated board and order' do
      let(:title) { 'Sample Column' }
      let(:board_id) { 1 }
      let(:order) { 1 }

      it 'does not add errors' do
        validator.call(column: column)
        expect(validator.errors).to be_empty
      end
    end

    context 'when column has no title, board or order' do
      let(:title) { nil }
      let(:board_id) { nil }
      let(:order) { nil }

      it 'adds an error message' do
        allow(I18n).to receive(:t).with('errors.column.title_must_be_present').and_return('Title must be present')
        allow(I18n).to receive(:t).with('errors.column.order_must_be_present').and_return('Order must be present')
        allow(I18n).to receive(:t).with('errors.column.board_must_be_associated').and_return('Board must be associated')

        validator.call(column: column)
        
        expect(validator.errors).to include('Title must be present')
        expect(validator.errors).to include('Order must be present')
        expect(validator.errors).to include('Board must be associated')
        expect(column.errors).to have_received(:add).with(:general, 'Title must be present')
        expect(column.errors).to have_received(:add).with(:general, 'Order must be present')
        expect(column.errors).to have_received(:add).with(:general, 'Board must be associated')
      end
    end
  end

  describe '#successful?' do
    context 'when there are no errors' do
      let(:title) { 'Valid Title' }
      let(:board_id) { 1 }
      let(:order) { 1 }

      it 'returns true' do
        validator.call(column: column)
        expect(validator.successful?).to be true
      end
    end

    context 'when there are errors' do
      let(:title) { nil }
      let(:board_id) { nil }
      let(:order) { nil }

      it 'returns false' do
        validator.call(column: column)
        expect(validator.successful?).to be false
      end
    end
  end
end