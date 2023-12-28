# frozen_string_literal: true

require 'swagger_helper'

describe 'Hunters::Sessions API' do
  path '/api/v1/hunters/sign_in' do
    post 'Signs in a Hunter' do
      tags 'Hunters::Sessions'
      consumes 'application/json'
      parameter name: :hunter, in: :body, schema: {
        type: :object,
        properties: {
          hunter: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            },
            required: %w[email password]
          }
        },
        required: ['hunter']
      }

      response '200', 'Hunter signed in' do
        run_test!
      end

      response '401', 'Invalid credentials' do
        run_test!
      end
    end
  end

  path '/api/v1/hunters/sign_out' do
    delete 'Signs out a Hunter' do
      tags 'Hunters::Sessions'
      consumes 'application/json'

      response '200', 'Hunter signed out' do
        run_test!
      end

      response '401', 'Invalid credentials' do
        run_test!
      end
    end
  end
end
