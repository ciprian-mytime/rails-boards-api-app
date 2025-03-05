class ColumnsController < ApplicationController
    def index
        render json: Column.all
    end

    def show
        render json: Column.find(params[:id])
    end

    def create
        column = Column.create(column_params)
        render json: column, status: :created
    end

    def update
        column = Column.find(params[:id])
        column.update!(column_params)
        render json: column
    end

    def destroy
        Column.find(params[:id]).destroy
        head :no_content
    end

    private
    def column_params
        params.permit(:title)
    end
end
