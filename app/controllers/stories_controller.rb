class StoriesController < ActionController::Base
    include Pundit::Authorization
    
    before_action :authenticate_user!
    before_action :set_board
    before_action :set_column
    before_action :set_story, only: [:edit, :update, :destroy]

    def new
        authorize @board
        @story = @column.stories.new
      end
    def create
        authorize @board
        @story = @column.stories.new(story_params)

        if @story.save
            redirect_to board_column_path(@board, @column), notice: "Story created sucessfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        authorize @board
    end
    def update
        authorize @board
        if @story.update(story_params)
            @column = @story.column
            redirect_to board_column_path(@board, @column), notice: "Story updated successfully", status: :see_other
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        authorize @board
        @story.destroy
        redirect_to board_column_path(@board, @column), notice: "Story destroyed successfully", status: :see_other
    end

    def filter
        statuses = params[:status]&.split(',') || []
        due_dates = params[:due_date]&.split(',') || []

        if !statuses.empty? && !due_dates.empty? then
            stories = @column.stories.where(status: statuses, due_date: due_dates)
        elsif !statuses.empty? then
            stories = @column.stories.where(status: statuses)
        elsif !due_dates.empty? then
            stories = @column.stories.where(due_date: due_dates)
        else stories = @column.stories
        end

        render json: stories
    end

    private
    def set_board
        @board = Board.find(params[:board_id])
    end
    def set_column
        @column = Column.find(params[:column_id])
    end
    def set_story
        @story = Story.includes(column: { board: :columns }).find(params[:id])
    end
    def story_params
        params.require(:story).permit(:title, :description, :order, :status, :due_date, :column_id)
    end
end
