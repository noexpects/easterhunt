# frozen_string_literal: true

require 'swagger_helper'

describe 'Admins EasterEggs API' do
  path '/api/v1/admins/easter_eggs' do
    get 'Retrieves a list of Easter Eggs' do
      tags 'Admins::EasterEggs'
      security [apiKey: []]
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :revealed, in: :query, type: :boolean, description: 'Filter by revealed status (true/false)',
                required: false
      parameter name: :hunter_email, in: :query, type: :string, description: 'Filter by hunter email', required: false

      response '200', 'Easter Eggs found' do
        run_test!
      end
    end

    post 'Creates a new Easter Egg' do
      tags 'Admins::EasterEggs'
      security [apiKey: []]
      consumes 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :easter_egg, in: :body, schema: {
        type: :object,
        properties: {
          latitude: { type: :number },
          longitude: { type: :number },
          clue: { type: :string }
        }
      }

      response '201', 'Easter Egg created' do
        run_test!
      end

      response '422', 'Invalid parameters' do
        run_test!
      end
    end
  end

  path '/api/v1/admins/easter_eggs/{id}' do
    parameter name: :id, in: :path, type: :integer

    put 'Updates an existing Easter Egg' do
      tags 'Admins::EasterEggs'
      security [apiKey: []]
      consumes 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :easter_egg, in: :body, schema: {
        type: :object,
        properties: {
          latitude: { type: :number },
          longitude: { type: :number },
          clue: { type: :string }
        },
        required: %w[latitude longitude clue]
      }

      response '200', 'Easter Egg updated' do
        run_test!
      end

      response '422', 'Invalid parameters' do
        run_test!
      end
    end
  end
end
