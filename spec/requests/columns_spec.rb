require 'swagger_helper'

RSpec.describe 'columns', type: :request do
  path '/boards/{board_id}/columns' do
    get 'Retrieves all columns on a board' do
      tags 'Columns'
      produces 'application/json'
      operationId 'listColumns'
      description 'Fetches all columns linked to a board'
      parameter name: :board_id, in: :path, required: true, type: :integer, description: 'Board id'

      response '200', 'Columns retrieved successfully' do
        run_test!
      end
    end

    post 'Create a new column' do
      tags 'Columns'
      produces 'application/json'
      operationId 'createColumn'
      description 'Creates a new column and returns it'
      parameter name: :board_id, in: :path, required: true, type: :integer, description: 'Board id'
      parameter name: :column, in: :body, required: true, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          order: { type: :integer }
        }
      }

      response '201', 'Column created successfully' do
        run_test!
      end
    end

  end

  path '/boards/{board_id}/columns/{id}' do
    get 'Retrieves a column' do
      tags 'Columns'
      produces 'application/json'
      operationId 'getColumn'
      description 'Fetches a column by id'
      parameter name: :board_id, in: :path, required: true, type: :integer, description: 'Board id'
      parameter name: :id, in: :path, required: true, type: :integer, description: 'Column id'

      response '200', 'Column retrieved successfully' do
        run_test!
      end
    end

    put 'Update a column' do
      tags 'Columns'
      produces 'application/json'
      operationId 'updateColumn'
      description 'Updates a column by id'
      parameter name: :board_id, in: :path, required: true, type: :integer, description: 'Board id'
      parameter name: :id, in: :path, required: true, type: :integer, description: 'Column id'
      parameter name: :column, in: :body, required: true, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          order: { type: :integer }
        }
      }

      response '200', 'Column updated successfully' do
        run_test!
      end
    end

    delete 'Delete a column' do
      tags 'Columns'
      produces 'application/json'
      operationId 'deleteColumn'
      description 'Deletes a column by id'
      parameter name: :board_id, in: :path, required: true, type: :integer, description: 'Board id'
      parameter name: :id, in: :path, required: true, type: :integer, description: 'Column id'
      
      response '204', 'Column deleted successfully' do
        run_test!
      end
    end
  end
end
