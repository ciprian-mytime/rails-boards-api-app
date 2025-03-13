class ColumnPresenter
  def initialize(column)
    @column = column
  end

  def as_json(options = {})
    {
      title: @column.title,
      stories: @column.stories.map { |story| StoryPresenter.new(story).as_json(options) }
    }
  end
end
