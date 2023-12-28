# frozen_string_literal: true

RSpec.describe 'Log in' do
  describe 'Success' do
    before do
      page.driver.browser.authorize(Rails.application.credentials.dig(:admin_panel, :name),
                                    Rails.application.credentials.dig(:admin_panel, :password))
      visit admin_panel_root_path
    end

    describe 'Redirect after login works correctly' do
      it { expect(status_code).to be(200) }
      it { expect(page).to have_current_path(admin_panel_root_path) }
    end
  end
end
