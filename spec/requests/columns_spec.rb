require 'swagger_helper'

RSpec.describe 'columns', type: :request do

  path '/boards/{board_id}/columns' do
    # You'll want to customize the parameter types...
    parameter name: 'board_id', in: :path, type: :string, description: 'board_id'

    get('list columns') do
      response(200, 'successful') do
        let(:board_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end

    post('create column') do
      response(200, 'successful') do
        let(:board_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end
  end

  path '/boards/{board_id}/columns/new' do
    # You'll want to customize the parameter types...
    parameter name: 'board_id', in: :path, type: :string, description: 'board_id'

    get('new column') do
      response(200, 'successful') do
        let(:board_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end
  end

  path '/boards/{board_id}/columns/{id}/edit' do
    # You'll want to customize the parameter types...
    parameter name: 'board_id', in: :path, type: :string, description: 'board_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('edit column') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end
  end

  path '/boards/{board_id}/columns/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'board_id', in: :path, type: :string, description: 'board_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show column') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end

    patch('update column') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end

    put('update column') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end

    delete('delete column') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end
  end
end
