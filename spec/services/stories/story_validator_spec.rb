require 'rails_helper'

RSpec.describe Stories::StoryValidator do
  let(:story) { instance_double('Story', title: title, column_id: column_id, order: order, errors: instance_double('ActiveModel::Errors', add: nil)) }
  subject(:validator) { described_class.new }

  describe '#call' do
    context 'when story has title, assiciated board and order' do
      let(:title) { 'Sample Story' }
      let(:column_id) { 1 }
      let(:order) { 1 }

      it 'does not add errors' do
        validator.call(story: story)
        expect(validator.errors).to be_empty
      end
    end

    context 'when story has no title, board or order' do
      let(:title) { nil }
      let(:column_id) { nil }
      let(:order) { nil }

      it 'adds an error message' do
        allow(I18n).to receive(:t).with('errors.story.title_must_be_present').and_return('Title must be present')
        allow(I18n).to receive(:t).with('errors.story.order_must_be_present').and_return('Order must be present')
        allow(I18n).to receive(:t).with('errors.story.column_must_be_associated').and_return('Column must be associated')

        validator.call(story: story)
        
        expect(validator.errors).to include('Title must be present')
        expect(validator.errors).to include('Order must be present')
        expect(validator.errors).to include('Column must be associated')
        expect(story.errors).to have_received(:add).with(:general, 'Title must be present')
        expect(story.errors).to have_received(:add).with(:general, 'Order must be present')
        expect(story.errors).to have_received(:add).with(:general, 'Column must be associated')
      end
    end
  end

  describe '#successful?' do
    context 'when there are no errors' do
      let(:title) { 'Valid Title' }
      let(:column_id) { 1 }
      let(:order) { 1 }

      it 'returns true' do
        validator.call(story: story)
        expect(validator.successful?).to be true
      end
    end

    context 'when there are errors' do
      let(:title) { nil }
      let(:column_id) { nil }
      let(:order) { nil }

      it 'returns false' do
        validator.call(story: story)
        expect(validator.successful?).to be false
      end
    end
  end
end