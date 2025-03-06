class BoardsController < ActionController::Base
    def index
        render json: Board.all
    end
    def show
        render json: Board.find(params[:id])
    end
    def create
        board = Board.create(board_params)
        render json: board, status: :created
    end
    def update
        board = Board.find(params[:id])
        board.update!(board_params)
        render json: board
    end
    def destroy
        Board.find(params[:id]).destroy
        head :no_content
    end

    private
    def board_params
        params.permit(:title)
    end
end
