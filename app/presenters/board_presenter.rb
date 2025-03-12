class BoardPresenter
  def initialize(board)
    @board = board
  end

  def as_json(options = {})
    if options.key?(:board_title_upcase)
      @board.title = @board.title.upcase
    end

    if options.key?(:prettify_dates_us)
      created_pretty_date = @board.created_at.strftime('%A, %B %d, %Y')
      updated_pretty_date = @board.updated_at.strftime('%A, %B %d, %Y')
    end
    if options.key?(:prettify_dates_row)
      created_pretty_date = @board.created_at.strftime('%Y---%B---%d')
      updated_pretty_date = @board.updated_at.strftime('%Y---%B---%d')
    end

    {
      id: @board.id,
      title: @board.title,
      created: created_pretty_date || @board.created_at,
      last_update: updated_pretty_date || @board.updated_at,
      columns: @board.columns.map { |column| ColumnPresenter.new(column).as_json(options) }
    }
  end
end