# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, if: :json_request?

  private

  def json_request?
    request.format.json?
  end

  def validation_errors(errors)
    render json: { errors: format_validation_errors(errors) }, status: :unprocessable_entity
  end

  def format_validation_errors(errors)
    errors.to_h.transform_values { |v| v.join(', ') }
  end
end
