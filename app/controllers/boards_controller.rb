class BoardsController < ActionController::Base
    before_action :set_board, only: [:show, :edit, :update, :destroy, :filter_stories]
    
    def index
        if params[:showall] == "true"
            @boards = Board.includes(columns: :stories).all
            render json: @boards, include: { columns: { include: :stories } }
        else
            @boards = Board.all
        end
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
        @board.destroy
        redirect_to boards_path, notice: "Board destroyed successfully", status: :see_other
    end

    def filter_stories
        statuses = params[:status]&.split(',') || []
        due_dates = params[:due_date]&.split(',') || []

        stories = @board.stories

        if !statuses.empty? && !due_dates.empty? then
            stories = stories.where(status: statuses, due_date: due_dates)
        elsif !statuses.empty? then
            stories = stories.where(status: statuses)
        elsif !due_dates.empty? then
            stories = stories.where(due_date: due_dates)
        else stories = stories
        end

        render json: stories
    end

    private
    def set_board
        @board = Board.includes(columns: :stories).find(params[:id])
      end

    def board_params
        params.require(:board).permit(:title)
    end
end
