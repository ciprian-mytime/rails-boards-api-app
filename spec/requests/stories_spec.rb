require 'swagger_helper'

RSpec.describe 'stories', type: :request do

  path '/boards/{board_id}/columns/{column_id}/stories/filter' do
    # You'll want to customize the parameter types...
    parameter name: 'board_id', in: :path, type: :string, description: 'board_id'
    parameter name: 'column_id', in: :path, type: :string, description: 'column_id'

    get('filter story') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:column_id) { '123' }

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

  path '/boards/{board_id}/columns/{column_id}/stories' do
    # You'll want to customize the parameter types...
    parameter name: 'board_id', in: :path, type: :string, description: 'board_id'
    parameter name: 'column_id', in: :path, type: :string, description: 'column_id'

    get('list stories') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:column_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end

    post('create story') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:column_id) { '123' }

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

  path '/boards/{board_id}/columns/{column_id}/stories/new' do
    # You'll want to customize the parameter types...
    parameter name: 'board_id', in: :path, type: :string, description: 'board_id'
    parameter name: 'column_id', in: :path, type: :string, description: 'column_id'

    get('new story') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:column_id) { '123' }

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

  path '/boards/{board_id}/columns/{column_id}/stories/{id}/edit' do
    # You'll want to customize the parameter types...
    parameter name: 'board_id', in: :path, type: :string, description: 'board_id'
    parameter name: 'column_id', in: :path, type: :string, description: 'column_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('edit story') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:column_id) { '123' }
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

  path '/boards/{board_id}/columns/{column_id}/stories/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'board_id', in: :path, type: :string, description: 'board_id'
    parameter name: 'column_id', in: :path, type: :string, description: 'column_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show story') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:column_id) { '123' }
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

    patch('update story') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:column_id) { '123' }
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

    put('update story') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:column_id) { '123' }
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

    delete('delete story') do
      response(200, 'successful') do
        let(:board_id) { '123' }
        let(:column_id) { '123' }
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
