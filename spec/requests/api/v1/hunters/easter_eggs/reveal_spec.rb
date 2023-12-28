# frozen_string_literal: true

require 'swagger_helper'

describe 'Hunters::EasterEggs::RevealController API' do
  path '/api/v1/hunters/easter_eggs/reveal' do
    post 'Reveals an Easter Egg for a Hunter' do
      tags 'Hunters::EasterEggs::RevealController'
      security [apiKey: []]
      consumes 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :reveal, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          code: { type: :string }
        },
        required: %w[id code]
      }

      response '200', 'Easter Egg revealed' do
        run_test!
      end

      response '401', 'Unauthorized' do
        run_test!
      end

      response '422', 'Invalid parameters' do
        run_test!
      end
    end
  end
end
