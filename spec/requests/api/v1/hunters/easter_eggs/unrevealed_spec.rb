# frozen_string_literal: true

require 'swagger_helper'

describe 'Hunters::EasterEggs::UnrevealedController API' do
  path '/api/v1/hunters/easter_eggs/unrevealed' do
    get 'Retrieves the list of unrevealed Easter Eggs for the Hunter' do
      tags 'Hunters::EasterEggs::UnrevealedController'
      security [apiKey: []]
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string

      response '200', 'List of unrevealed Easter Eggs retrieved' do
        run_test!
      end

      response '401', 'Unauthorized' do
        run_test!
      end
    end
  end
end
