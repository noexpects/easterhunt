# frozen_string_literal: true

class AdminPanel::AdminApplicationController < Administrate::ApplicationController
  http_basic_authenticate_with(
    name: Rails.application.credentials.dig(:admin_panel, :name),
    password: Rails.application.credentials.dig(:admin_panel, :password)
  )
end
