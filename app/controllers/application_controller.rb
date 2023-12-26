# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def validation_errors(errors)
    render json: { errors: format_validation_errors(errors) }, status: :unprocessable_entity
  end

  def format_validation_errors(errors)
    errors.to_h.transform_values { |v| v.join(', ') }
  end
end
