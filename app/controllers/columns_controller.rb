class ColumnsController < ActionController::Base
    before_action :set_board
    before_action :set_column, only: [:show, :update, :destroy]

    def index
        columns = @board.columns
        # render json: columns
    end
    def show
        # render json: @column
    end
    def create
        column = @board.columns.create(column_params)
        # render json: column, status: :created
    end
    def update
        @column.update!(column_params)
        # render json: @column
    end
    def destroy
        @column.destroy
        head :no_content
    end

    private
    def set_board
        @board = Board.find(params[:board_id])
    end
    def set_column
        @column = @board.columns.find(params[:id])
    end
    def column_params
        params.permit(:title, :order)
    end
end
