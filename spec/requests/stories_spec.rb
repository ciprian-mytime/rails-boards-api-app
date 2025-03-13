require 'swagger_helper'

RSpec.describe 'stories', type: :request do
  path '/boards/{board_id}/columns/{column_id}/stories' do
    get 'Retrieves all stories on a column' do
      tags 'Stories'
      produces 'application/json'
      operationId 'listStories'
      description 'Fetches all stories linked to a column'
      parameter name: :board_id, in: :path, required: true, type: :integer, description: 'Board id'
      parameter name: :column_id, in: :path, required: true, type: :integer, description: 'Column id'

      response '200', 'Stories retrieved successfully' do
        run_test!
      end
    end

    post 'Create a new story' do
      tags 'Stories'
      produces 'application/json'
      operationId 'createStory'
      description 'Creates a new story and returns it'
      parameter name: :board_id, in: :path, required: true, type: :integer, description: 'Board id'
      parameter name: :column_id, in: :path, required: true, type: :integer, description: 'Column id'
      parameter name: :story, in: :body, required: true, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          order: { type: :integer },
          description: { type: :string },
          status: { type: :string },
          due_date: { type: :string, format: :datetime }
        }
      }

      response '201', 'Story created successfully' do
        run_test!
      end
    end

  end

  path '/boards/{board_id}/columns/{column_id}/stories/{id}' do
    get 'Retrieves a story' do
      tags 'Stories'
      produces 'application/json'
      operationId 'getStory'
      description 'Fetches a story by id'
      parameter name: :board_id, in: :path, required: true, type: :integer, description: 'Board id'
      parameter name: :column_id, in: :path, required: true, type: :integer, description: 'Column id'
      parameter name: :id, in: :path, required: true, type: :integer, description: 'Story id'

      response '200', 'Story retrieved successfully' do
        run_test!
      end
    end

    put 'Update a story' do
      tags 'Stories'
      produces 'application/json'
      operationId 'updateStory'
      description 'Updates a story by id'
      parameter name: :board_id, in: :path, required: true, type: :integer, description: 'Board id'
      parameter name: :column_id, in: :path, required: true, type: :integer, description: 'Column id'
      parameter name: :id, in: :path, required: true, type: :integer, description: 'Story id'
      parameter name: :story, in: :body, required: true, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          order: { type: :integer },
          description: { type: :string },
          status: { type: :string },
          due_date: { type: :string, format: :datetime }
        }
      }

      response '200', 'Story updated successfully' do
        run_test!
      end
    end

    delete 'Delete a story' do
      tags 'Stories'
      produces 'application/json'
      operationId 'deleteStory'
      description 'Deletes a story by id'
      parameter name: :board_id, in: :path, required: true, type: :integer, description: 'Board id'
      parameter name: :column_id, in: :path, required: true, type: :integer, description: 'Column id'
      parameter name: :id, in: :path, required: true, type: :integer, description: 'Story id'
            
      response '204', 'Story deleted successfully' do
        run_test!
      end
    end
  end
end
