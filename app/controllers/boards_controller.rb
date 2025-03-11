class BoardsController < ActionController::Base
    include Pundit::Authorization

    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
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
        # authorize @board
    end

    def new
        # authorize Board
        @board = Board.new
      end
    def create
        # authorize Board
        creator = BoardCreator.new
        creator.call(params: board_params)

        if creator.successful?
            redirect_to creator.board, notice: "Board created sucessfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        # authorize @board
    end
    def update
        # authorize @board
        updater = BoardUpdater.new
        updater.call(board: @board, params: board_params)

        if updater.successful?
            redirect_to updater.board, notice: "Board updated successfully", status: :see_other
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        # authorize @board
        destroyer = BoardDestroyer.new
        destroyer.call(board: @board)

        status = destroyer.successful? ? :ok : :unprocessable_entity
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
