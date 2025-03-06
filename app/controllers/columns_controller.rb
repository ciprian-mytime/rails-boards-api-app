class ColumnsController < ActionController::Base
    before_action :set_board
    before_action :set_column

    def edit
    end
    def update
        if @column.update(column_params)
            redirect_to board_path(@column.board), notice: "column updated successfully", status: :see_other
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
    def set_board
        @board = Board.find(params[:board_id])
    end
    def set_column
        @column = @board.columns.find(params[:id])
    end
    def column_params
        params.require(:column).permit(:title, :order)
    end
end
