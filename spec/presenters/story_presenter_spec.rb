require 'rails_helper'

RSpec.describe StoryPresenter, type: :presenter do
  let(:story) { create(:story,
    title: "Present Title",
    order: 1,
    description: "Present Description",
    status: 'test status',
    created_at: 1.day.ago,
    updated_at: Time.now
  ) }
  let(:presenter) { StoryPresenter.new(story) }

  describe '#as_json' do
    context 'status field is present on story/ not empty' do
      it 'status appears in the formatted json' do
        json = presenter.as_json
        expect(json[:status]).to eq(story.status)
      end
    end

    context 'status field is not present/ is empty' do
      it 'status does not appear in the formatted json' do
        story.status = ""
        json = presenter.as_json
        expect(json[:status]).to be_nil
      end
    end
  end
end
