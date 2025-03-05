class StoriesController < ApplicationController
    def index
        render json: Story.all
    end

    def show
        render json: Story.find(params[:id])
    end

    def create
        story = Story.create(story_params)
        render json: story, status: :created
    end

    def update
        story = Story.find(params[:id])
        story.update!(story_params)
        render json: story
    end

    def destroy
        Story.find(params[:id]).destroy
        head :no_content
    end

    private
    def story_params
        params.permit(:title)
    end
end
