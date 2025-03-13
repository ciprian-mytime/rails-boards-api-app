module Boards
  class BoardDestroyer
    attr_reader :board

    def successful?
      !!@successful
    end

    def can_destroy?
      true
    end

    def call(board:)
      @board = board
      @successful = can_destroy?
      return self unless successful?

      destroy_board
      self
    end

    private
    def destroy_board
      ActiveRecord::Base.transaction do
        @successful &&= @board.destroy
        raise ActiveRecord::Rollback unless successful?
      end
    end
  end
end
