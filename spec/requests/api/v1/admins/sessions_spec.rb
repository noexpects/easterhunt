# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Admin::Sessions' do
  let!(:created_admin) { create(:admin) }
  let(:admin_credentials) { attributes_for(:admin)[:password] }
  let(:admin) { { email: created_admin.email, password: admin_credentials } }

  path '/api/v1/admins/login' do
    describe 'POST #create' do
      post 'Create a session' do
        tags 'Admin::Sessions'

        consumes 'application/json'
        produces 'application/json'
        parameter name: :admin, in: :body, schema: {
          type: :object,
          properties: {
            admin: {
              type: :object,
              properties: {
                email: { type: :string },
                password: { type: :string }
              },
              required: %w[email password]
            }
          },
          required: ['admin']
        }

        response 201, 'Success' do
          include_context 'generate response api doc'

          run_test!
        end

        response 422, 'Unprocessable entity' do
          include_context 'generate response api doc'

          let(:admin_credentials) { 'foo' }
          run_test!
        end
      end
    end
  end
end
