class StoriesController < ActionController::Base
    before_action :set_board
    before_action :set_column
    before_action :set_story, only: [:edit, :update]

    def new
        @story = @column.stories.new
      end
    def create
        @story = @column.stories.new(story_params)

        if @story.save
            redirect_to @board, notice: "Story created sucessfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end
    def update
        if @story.update(story_params)
            redirect_to @board, notice: "Story updated successfully", status: :see_other
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # def filter
    #     statuses = params[:status]&.split(',') || []
    #     due_dates = params[:due_date]&.split(',') || []

    #     if !statuses.empty? && !due_dates.empty? then
    #         stories = @column.stories.where(status: statuses, due_date: due_dates)
    #     elsif !statuses.empty? then
    #         stories = @column.stories.where(status: statuses)
    #     elsif !due_dates.empty? then
    #         stories = @column.stories.where(due_date: due_dates)
    #     else stories = @column.stories
    #     end

    #     render json: stories
    # end

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
        params.require(:story).permit(:title, :description, :order, :status, :due_date)
    end
end
