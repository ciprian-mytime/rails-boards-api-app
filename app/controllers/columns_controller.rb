class ColumnsController < ActionController::Base
    include Pundit::Authorization
    
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
    before_action :set_board
    before_action :set_column, only: [:show, :edit, :update, :destroy]

    def show
        # authorize @board
    end

    def new
        # authorize @board
        @column = @board.columns.new
      end
    def create
        # authorize @board
        @column = @board.columns.new(column_params)

        if @column.save
            redirect_to board_column_path(@board, @column), notice: "Column created sucessfully"
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def edit
        # authorize @board
    end
    def update
        # authorize @board
        if @column.update(column_params)
            redirect_to board_column_path(@board, @column), notice: "Column updated successfully", status: :see_other
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        # authorize @board
        @column.destroy
        redirect_to board_path(@board), notice: "Column destroyed successfully", status: :see_other
    end

    private
    def set_board
        @board = Board.find(params[:board_id])
    end
    def set_column
        @column = Column.find(params[:id])
    end
    def column_params
        params.require(:column).permit(:title, :order)
    end
end
