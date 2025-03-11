module Boards
  class BoardUpdater
    attr_reader :params, :board, :skip_validation, :validator_service

    def successful?
      !!@successful
    end

    def call(board:, params:)
      @board = board
      @params = params
    
      update_board
      self
    end

    private
    def update_board
      ActiveRecord::Base.transaction do
        @successful = @board.update!(@params)
        raise ActiveRecord::Rollback unless successful?
      end
    end
  end
end