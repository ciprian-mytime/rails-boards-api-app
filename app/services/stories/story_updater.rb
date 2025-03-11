module Stories
  class StoryUpdater
    attr_reader :params, :story, :skip_validation, :validator_service

    def successful?
      !!@successful
    end

    def call(story:, params:)
      @story = story
      @params = params
    
      update_story
      self
    end

    private
    def update_story
      ActiveRecord::Base.transaction do
        @successful = @story.update!(@params)
        raise ActiveRecord::Rollback unless successful?
      end
    end
  end
end