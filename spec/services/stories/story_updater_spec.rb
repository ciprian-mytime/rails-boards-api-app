require 'rails_helper'

RSpec.describe Stories::StoryUpdater do
  let(:story) { instance_double('Story') }
  let(:params) {{ title: 'UPDATED Test Story Title' }}

  subject(:updater) { described_class.new }

  describe '#call' do
    context 'when update is successful' do
      it 'updates a story and mark successful true' do
        expect(story).to receive(:update!).and_return(true)
        result = updater.call(story: story, params: params)
        expect(result.successful?).to be true
      end
    end

    context 'when update fails' do
      it 'marks successful false' do
        expect(story).to receive(:update!).and_return(false)
        result = updater.call(story: story, params: params)
        expect(result.successful?).to be false
      end
    end
  end
end