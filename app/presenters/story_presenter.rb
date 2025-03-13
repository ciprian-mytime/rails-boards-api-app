class StoryPresenter
  def initialize(story)
    @story = story
  end

  def as_json(options = {})
    result = {
      title: @story.title,
      description: @story.description
    }
    result[:status] = @story.status unless @story.status == ""

    result
  end
end
