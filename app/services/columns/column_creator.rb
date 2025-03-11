module Columns
  class ColumnCreator
    attr_reader :params, :board, :column, :skip_validation, :validator_service

    def initialize(validator_service: Columns::ColumnValidator.new)
      @validator_service = validator_service
    end

    def successful?
      !!@successful
    end

    def call(board:, params:)
      @board = board
      @params = params
      
      build_column
      validate
      return self unless @successful

      create_column
      self
    end

    private
    def create_column
      ActiveRecord::Base.transaction do
          @successful &&= @column.save
          raise ActiveRecord::Rollback unless successful?
      end
    end
    def build_column
      @column = Column.new(@params)
      @column.board = @board
    end

    def validate
      @successful = skip_validation || @validator_service.call(column: @column).successful?
    end
  end
end