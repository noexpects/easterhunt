# frozen_string_literal: true

class AdminPanel::AdminApplicationController < Administrate::ApplicationController
  before_action :authenticate_admin!
end
