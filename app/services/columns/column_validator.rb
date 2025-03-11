module Columns
  class ColumnValidator
    attr_reader :column, :errors

    def call(column:)
      @column = column
      @errors = []

      if without_parent_board?(@column)
        @errors << I18n.t('errors.column.board_must_be_associated')
      end
      if without_title?(@column)
        @errors << I18n.t('errors.column.title_must_be_present')
      end
      if without_order?(@column)
        @errors << I18n.t('errors.column.order_must_be_present')
      end
      
      @errors.each do |error|
        column.errors.add(:general, error)
      end

      self
    end

    def successful?
      @errors.blank?
    end

    private
    def without_parent_board?(column)
      return false if column.board_id
      true
    end

    def without_title?(column)
      return false if column.title
      true
    end

    def without_order?(column)
      return false if column.order
      true
    end
  end
end