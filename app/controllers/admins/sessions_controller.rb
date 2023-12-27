# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(_resource_or_scope)
    admin_panel_root_path
  end
end
