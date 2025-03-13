require 'rails_helper'

RSpec.describe Stories::StoryCreator do
  let(:column) { instance_double('Column') }
  let(:story) { instance_double('Story') }
  let(:params) { { title: 'Test Story Title' } }

  subject(:validator) { instance_double(Stories::StoryValidator) }
  subject(:creator) { described_class.new(validator_service: validator) }

  before do
    allow(Story).to receive(:new).with(params).and_return(story)
    allow(story).to receive(:column=).with(column)
  end

  describe '#call' do
    context 'when validation is successful' do
      it 'creates a story and marks successful true' do
        allow(validator).to receive(:call).with(story: story).and_return(double(successful?: true))

        expect(story).to receive(:save).and_return(true)
        result = creator.call(column: column, params: params)
        expect(result.successful?).to be true
      end
    end

    context 'when validation fails' do
      it 'does not create a story and mark successful false' do
        allow(validator).to receive(:call).with(story: story).and_return(double(successful?: false))

        expect(story).not_to receive(:save)
        result = creator.call(column: column, params: params)
        expect(result.successful?).to be false
      end
    end

    context 'when saving fails' do
      it 'marks successful false' do
        allow(validator).to receive(:call).with(story: story).and_return(double(successful?: false))
        allow(story).to receive(:save).and_return(false)

        result = creator.call(column: column, params: params)
        expect(result.successful?).to be false
      end
    end
  end
end
