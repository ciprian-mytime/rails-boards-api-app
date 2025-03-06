class BoardsController < ActionController::Base
    before_action :set_board, only: [:show, :edit, :update, :destroy]
    
    def index
        @boards = Board.all
    end
    def show
    end

    def new
        @board = Board.new
      end
    def create
        @board = Board.new(board_params)

        if @board.save
            redirect_to @board, notice: "Board created sucessfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end
    def update
        if @board.update(board_params)
            redirect_to @board, notice: "Board updated successfully", status: :see_other
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @board.destroy!
        redirect_to board_path, notice: "Board destroyed successfully", status: :see_other
    end

    private
    def set_board
        @board = Board.find(params.expect(:id))
      end

    def board_params
        params.permit(:title)
    end
end
