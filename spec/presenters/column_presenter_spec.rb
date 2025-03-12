require 'rails_helper'

RSpec.describe ColumnPresenter, type: :presenter do
  let(:column) { create(:column, title: "Present Column", order: 1, created_at: 1.day.ago, updated_at: Time.now) }
  let(:presenter) { ColumnPresenter.new(column) }

  describe '#as_json' do
    context 'when column has stories' do
      it 'applies story formatters to the column stories' do
        json = presenter.as_json
        stories = column.stories.map { |story| StoryPresenter.new(story).as_json }

        expect(json[:stories]).to eq(stories)
      end
    end
  end
end