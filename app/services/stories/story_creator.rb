module Stories
  class StoryCreator
    attr_reader :params, :column, :story, :skip_validation, :validator_service

    def initialize(validator_service: Stories::StoryValidator.new)
      @validator_service = validator_service
    end

    def successful?
      !!@successful
    end

    def call(column:, params:)
      @column = column
      @params = params

      build_story
      validate
      return self unless @successful

      create_story
      self
    end

    private
    def create_story
      ActiveRecord::Base.transaction do
          @successful &&= @story.save
          raise ActiveRecord::Rollback unless successful?
      end
    end
    def build_story
      @story = Story.new(@params)
      @story.column = @column
    end

    def validate
      @successful = skip_validation || @validator_service.call(story: @story).successful?
    end
  end
end
