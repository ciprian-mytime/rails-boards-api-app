# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under openapi_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a openapi_spec tag to the
  # the root example_group in your specs, e.g. describe '...', openapi_spec: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },

      components: {
        schemas: {
          Board: {
            type: :object, properties: {
              id: { type: :integer },
              title: { type: :string },
              created_at: { type: :string, format: :datetime },
              updated_at: { type: :string, format: :datetime },
              deleted_at: { type: :string, format: :datetime, nullable: true }
            },
            required: [ 'id', 'title', 'created_at', 'updated_at' ]
          },
          Column: {
            type: :object, properties: {
              id: { type: :integer },
              title: { type: :string },
              board_id: { type: :integer },
              order: { type: :integer, default: 0 },
              created_at: { type: :string, format: :datetime },
              updated_at: { type: :string, format: :datetime },
              deleted_at: { type: :string, format: :datetime, nullable: true }
            },
            required: [ 'id', 'title', 'board_id', 'order', 'created_at', 'updated_at' ]
          },
          Story: {
            type: :object, properties: {
              id: { type: :integer },
              title: { type: :string },
              column_id: { type: :integer },
              order: { type: :integer, default: 0 },
              description: { type: :string, nullable: true },
              status: { type: :string, nullable: true },
              due_date: { type: :string, format: :date_time, nullable: true },
              created_at: { type: :string, format: :datetime },
              updated_at: { type: :string, format: :datetime },
              deleted_at: { type: :string, format: :datetime, nullable: true }
            },
            required: [ 'id', 'title', 'column_id', 'order', 'created_at', 'updated_at' ]
          }
        }
      },

      paths: {},
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: '127.0.0.1:3000'
            }
          }
        }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The openapi_specs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.openapi_format = :yaml
end
