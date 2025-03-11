module Columns
  class ColumnDestroyer
    attr_reader :column

    def successful?
      !!@successful
    end

    def can_destroy?
      return true
    end

    def call(column:)
      @column = column
      @successful = can_destroy?
      return self unless successful?

      destroy_column
      self
    end

    private
    def destroy_column
      ActiveRecord::Base.transaction do
        @successful &&= @column.destroy
        raise ActiveRecord::Rollback unless successful?
      end
    end
  end
end