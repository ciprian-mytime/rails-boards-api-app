class ColumnsController < ActionController::Base
    before_action :set_board
    before_action :set_column, only: [:edit, :update, :destroy]

    def new
        @column = @board.columns.new
      end
    def create
        @column = @board.columns.new(column_params)

        if @column.save
            redirect_to @board, notice: "Column created sucessfully"
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def edit
    end
    def update
        if @column.update(column_params)
            redirect_to board_path(@column.board), notice: "Column updated successfully", status: :see_other
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @column.destroy
        redirect_to board_path(@board), notice: "Column destroyed successfully", status: :see_other
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
