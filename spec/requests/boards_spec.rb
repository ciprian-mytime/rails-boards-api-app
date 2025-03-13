require 'swagger_helper'

RSpec.describe 'boards', type: :request do
  path '/boards' do
    get 'Retrieves all boards' do
      tags 'Boards'
      produces 'application/json'
      operationId 'listBoards'
      description 'Fetches all boards with optional filtering'
      parameter name: :showall, in: :query, type: :string, description: 'Show all Boards > Columns > Stories'

      response '200', 'Boards retrieved successfully' do
        run_test!
      end
    end

    post 'Create a new board' do
      tags 'Boards'
      produces 'application/json'
      operationId 'createBoard'
      description 'Creates a new board and returns it'
      parameter name: :board, in: :body, required: true, schema: {
        type: :object,
        properties: {
          title: { type: :string }
        }
      }

      response '201', 'Board created successfully' do
        run_test!
      end
    end

  end

  path '/boards/{id}' do
    get 'Retrieves a board' do
      tags 'Boards'
      produces 'application/json'
      operationId 'getBoard'
      description 'Fetches a board by id'
      parameter name: :id, in: :path, required: true, type: :integer, description: 'Board id'

      response '200', 'Board retrieved successfully' do
        run_test!
      end
    end

    put 'Update a board' do
      tags 'Boards'
      produces 'application/json'
      operationId 'updateBoard'
      description 'Updates a board by id'
      parameter name: :id, in: :path, required: true, type: :integer, description: 'Board id'
      parameter name: :board, in: :body, required: true, schema: {
        type: :object,
        properties: {
          title: { type: :string }
        }
      }

      response '200', 'Board updated successfully' do
        run_test!
      end
    end

    delete 'Delete a board' do
      tags 'Boards'
      produces 'application/json'
      operationId 'deleteBoard'
      description 'Deletes a board by id'
      parameter name: :id, in: :path, required: true, type: :integer
      
      response '204', 'Board deleted successfully' do
        run_test!
      end
    end
  end
end
