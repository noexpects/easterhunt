# frozen_string_literal: true

RSpec.describe 'Hunter show page' do
  before do
    page.driver.browser.authorize(Rails.application.credentials.dig(:admin_panel, :name),
                                  Rails.application.credentials.dig(:admin_panel, :password))
    hunter = create(:hunter)
    create(:easter_egg, hunter:, revealed: true)

    visit admin_panel_hunter_url(hunter)
  end

  describe 'Reaching show page' do
    it { expect(status_code).to be(200) }
  end

  describe 'Hunter show page has correct attributes' do
    it { expect(page.has_css?('#id')).to be true }
    it { expect(page.has_css?('#email')).to be true }
    it { expect(page.has_css?('#created_at')).to be true }
  end

  describe 'Hunter show page shows hunters revealed eggs' do
    it { expect(page.has_css?('.action-show')).to be true }
  end
end
