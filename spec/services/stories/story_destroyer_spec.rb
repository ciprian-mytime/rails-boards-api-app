require 'rails_helper'

RSpec.describe Stories::StoryDestroyer do
  let(:story) { instance_double('Story') }
  subject(:destroyer) { described_class.new }

  describe '#call' do
    context 'when destroy is successful' do
      it 'deletes a story and mark successful true' do
        expect(story).to receive(:destroy).and_return(true)
        result = destroyer.call(story: story)
        expect(result.successful?).to be true
      end
    end

    context 'when destroy fails' do
      it 'marks successful false' do
        expect(story).to receive(:destroy).and_return(false)
        result = destroyer.call(story: story)
        expect(result.successful?).to be false
      end
    end
  end
end
