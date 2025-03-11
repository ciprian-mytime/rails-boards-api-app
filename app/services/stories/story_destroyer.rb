module Stories
  class StoryDestroyer
    attr_reader :story

    def successful?
      !!@successful
    end

    def can_destroy?
      return true
    end

    def call(story:)
      @story = story
      @successful = can_destroy?
      return self unless successful?

      destroy_story
      self
    end

    private
    def destroy_story
      ActiveRecord::Base.transaction do
        @successful &&= @story.destroy
        raise ActiveRecord::Rollback unless successful?
      end
    end
  end
end