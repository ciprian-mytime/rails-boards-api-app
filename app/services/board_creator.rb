class BoardCreator
    attr_reader :params, :board, :skip_validation, :validator_service

    def initialize(validator_service: BoardValidator.new)
        @validator_service = validator_service
    end

    def successful?
        !!@successful
    end

    def call(params:)
        @params = params
        
        build_board
        validate
        return self unless @successful

        create_board
        self
    end

    private
    def create_board
        ActiveRecord::Base.transaction do
            @successful &&= @board.save
            raise ActiveRecord::Rollback unless successful?
        end

    end
    def build_board
        @board = Board.new(@params)
    end

    def validate
        @successful = skip_validation || @validator_service.call(board: @board).successful?
    end
end