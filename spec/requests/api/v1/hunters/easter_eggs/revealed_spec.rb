# frozen_string_literal: true

require 'swagger_helper'

describe 'Hunters::EasterEggs::Revealed' do
  path '/api/v1/hunters/easter_eggs/revealed' do
    get 'Retrieves the list of Easter Eggs revealed by the Hunter' do
      tags 'Hunters::EasterEggs'
      security [apiKey: []]
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string

      response '200', 'List of revealed Easter Eggs retrieved' do
        run_test!
      end

      response '401', 'Unauthorized' do
        run_test!
      end
    end
  end
end
