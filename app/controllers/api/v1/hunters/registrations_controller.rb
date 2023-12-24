# frozen_string_literal: true

class Api::V1::Hunters::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix

  before_action :sign_up_params, only: [:create]

  respond_to :json

  private

  def render_response(status_code:, message:, data: nil)
    render json: { status: { code: status_code, message: }, data: }, status: status_code
  end

  def respond_with(resource, _opts = {})
    if request.post? && resource.persisted?
      render_response(status_code: :ok, message: I18n.t('devise.registrations.signed_up'),
                      data: HunterSerializer.new(resource).serializable_hash[:data][:attributes])
    elsif request.delete?
      render_response(status_code: :ok, message: I18n.t('devise.registrations.destroyed'))
    else
      render_response(status_code: :unprocessable_entity, message: resource.errors.full_messages.to_sentence)
    end
  end

  def sign_up_params
    params.require(:hunter).permit(:email, :password)
  end
end
