require 'swagger_helper'

describe 'Blogs API' do
    path '/boards' do
        get 'Returns a list of all boards' do
            tags 'Boards'

            response '200', 'list all boards' do
                schema type: :object,
                    properties: {
                        id: { type: :integer },
                        title: { type: :string },
                        created_at: { type: :string },
                        updated_at: { type: :string }
                    }
                
                run_test!
            end
        end
    end


    path '/boards/{id}' do
        get 'Retrieves a board' do
            tags 'Boards'
            parameter name: :id, in: :path, type: :string

            response '200', 'board found' do
                schema type: :object,
                    properties: {
                        id: { type: :integer },
                        title: { type: :string }
                    },
                    required: [ 'id', 'title' ]
                
                let(:id) { Board.create(title: 'test').id }
                run_test!
            end

            response '404', 'board not found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end
end