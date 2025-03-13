module Stories
  class StoryValidator
    attr_reader :story, :errors

    def call(story:)
      @story = story
      @errors = []

      if without_parent_column?(@story)
        @errors << I18n.t("errors.story.column_must_be_associated")
      end
      if without_title?(@story)
        @errors << I18n.t("errors.story.title_must_be_present")
      end
      if without_order?(@story)
        @errors << I18n.t("errors.story.order_must_be_present")
      end

      @errors.each do |error|
        story.errors.add(:general, error)
      end

      self
    end

    def successful?
      @errors.blank?
    end

    private
    def without_parent_column?(story)
      return false if story.column_id
      true
    end

    def without_title?(story)
      return false if story.title
      true
    end

    def without_order?(story)
      return false if story.order
      true
    end
  end
end
