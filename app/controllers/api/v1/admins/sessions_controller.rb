# frozen_string_literal: true

class Api::V1::Admins::SessionsController < Devise::SessionsController
  include RackSessionFix

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: I18n.t('devise.sessions.signed_in') },
      data: AdminSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_admin
      render json: { status: 200, message: I18n.t('devise.sessions.signed_out') }, status: :ok
    else
      render json: { status: 401, message: I18n.t('devise.sessions.already_signed_out') }, status: :unauthorized
    end
  end
end
