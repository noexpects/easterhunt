# frozen_string_literal: true

require 'swagger_helper'

describe 'Hunters::Registrations API' do
  path '/api/v1/hunters/sign_up' do
    post 'Creates a new Hunter' do
      tags 'Hunters::Registrations'
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

      response '200', 'Hunter signed up' do
        run_test!
      end

      response '422', 'Invalid parameters' do
        run_test!
      end
    end
  end

  path '/api/v1/hunters/cancel_registration' do
    delete 'Cancels Hunter registration' do
      tags 'Hunters::Registrations'
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

      response '200', 'Hunter registration canceled' do
        run_test!
      end

      response '422', 'Invalid parameters' do
        run_test!
      end
    end
  end
end
