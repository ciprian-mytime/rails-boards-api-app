module Columns
  class ColumnUpdater
    attr_reader :params, :column, :skip_validation, :validator_service

    def successful?
      !!@successful
    end

    def call(column:, params:)
      @column = column
      @params = params
    
      update_column
      self
    end

    private
    def update_column
      ActiveRecord::Base.transaction do
        @successful = @column.update!(@params)
        raise ActiveRecord::Rollback unless successful?
      end
    end
  end
end