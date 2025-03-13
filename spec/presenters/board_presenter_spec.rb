require 'rails_helper'

RSpec.describe BoardPresenter, type: :presenter do
  let(:board) { create(:board, title: "Present Board", created_at: 1.day.ago, updated_at: Time.now) }
  let(:presenter) { BoardPresenter.new(board) }

  describe '#as_json' do
    context 'when options include :board_title_upcase' do
      it 'returns the board with a formatted title' do
        options = { board_title_upcase: true }
        json = presenter.as_json(options)

        expect(json[:title]).to eq(board.title.upcase)
      end
    end

    context 'when options include :prettify_dates_us' do
      it 'returns the board with prettified dates in US format' do
        options = { prettify_dates_us: true }
        json = presenter.as_json(options)

        expect(json[:created]).to eq(board.created_at.strftime('%A, %B %d, %Y'))
        expect(json[:last_update]).to eq(board.updated_at.strftime('%A, %B %d, %Y'))
      end
    end

    context 'when options include :prettify_dates_row' do
      it 'returns the board with prettified dates in a custom format' do
        options = { prettify_dates_row: true }
        json = presenter.as_json(options)

        expect(json[:created]).to eq(board.created_at.strftime('%Y---%B---%d'))
        expect(json[:last_update]).to eq(board.updated_at.strftime('%Y---%B---%d'))
      end
    end

    context 'when no options are provided' do
      it 'returns the board with default fields' do
        json = presenter.as_json

        expect(json[:title]).to eq(board.title)
        expect(json[:created]).to eq(board.created_at)
        expect(json[:last_update]).to eq(board.updated_at)
      end
    end

    context 'when multiple options are provided' do
      it 'applies all formatters given as options' do
        options = { board_title_upcase: true, prettify_dates_us: true }
        json = presenter.as_json(options)

        expect(json[:title]).to eq(board.title.upcase)
        expect(json[:created]).to eq(board.created_at.strftime('%A, %B %d, %Y'))
        expect(json[:last_update]).to eq(board.updated_at.strftime('%A, %B %d, %Y'))
      end
    end

    context 'when board has columns' do
      it 'applies column formatters to the board columns' do
        json = presenter.as_json
        columns = board.columns.map { |column| ColumnPresenter.new(column).as_json }

        expect(json[:columns]).to eq(columns)
      end
    end
  end
end
