# frozen_string_literal: true

RSpec.describe 'Hunters index page', bullet: :skip do
  before do
    page.driver.browser.authorize(Rails.application.credentials.dig(:admin_panel, :name),
                                  Rails.application.credentials.dig(:admin_panel, :password))
    create_list(:hunter, 2)
  end

  describe 'Reaching hunters page' do
    before do
      visit admin_panel_hunters_path
    end

    it { expect(status_code).to be(200) }
  end

  describe 'Hunters table present' do
    before do
      visit admin_panel_hunters_path
    end

    it { expect(page.has_css?('table')).to be true }
  end

  describe 'Hunters table has correct number of rows' do
    before do
      visit admin_panel_hunters_path
    end

    it { expect(page.find_all('.js-table-row').count).to eq Hunter.count }
  end

  describe 'Edit action not present' do
    before do
      visit admin_panel_hunters_path
    end

    it { expect(page.has_css?('.action-edit')).to be false }
  end
end
