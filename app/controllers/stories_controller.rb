class StoriesController < ActionController::Base
    before_action :set_board
    before_action :set_column
    before_action :set_story, only: [:show, :update, :destroy]

    def index
        stories = @column.stories
        # render json: stories
    end
    def show
        # render json: @story
    end
    def create
        story = @column.stories.create(story_params)
        # render json: story, status: :created
    end
    def update
        @story.update!(story_params)
        # render json: @story
    end
    def destroy
        @story.destroy
        head :no_content
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

        # render json: stories
    end

    private
    def set_board
        @board = Board.find(params[:board_id])
    end
    def set_column
        @column = @board.columns.find(params[:column_id])
    end
    def set_story
        @story = @column.stories.find(params[:id])
    end
    def story_params
        params.permit(:title, :description, :order, :status, :due_date)
    end
end
