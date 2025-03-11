module Boards
  class BoardValidator
    attr_reader :board, :errors

    def call(board:)
      @board = board
      @errors = []

      if without_title?(@board)
        @errors << I18n.t('errors.board.title_must_be_present')
      end
      
      @errors.each do |error|
        board.errors.add(:general, error)
      end

      self
    end

    def successful?
      @errors.blank?
    end

    private
    def without_title?(board)
      return false if board.title
      true
    end
  end
end