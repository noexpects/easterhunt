# frozen_string_literal: true

RSpec.describe 'Easter eggs index page', bullet: :skip do
  before do
    page.driver.browser.authorize(Rails.application.credentials.dig(:admin_panel, :name),
                                  Rails.application.credentials.dig(:admin_panel, :password))
    create_list(:easter_egg, 2)
  end

  describe 'Reaching easter eggs page' do
    before do
      visit admin_panel_easter_eggs_path
    end

    it { expect(status_code).to be(200) }
  end

  describe 'Easter eggs table present' do
    before do
      visit admin_panel_easter_eggs_path
    end

    it { expect(page.has_css?('table')).to be true }
  end

  describe 'Easter eggs table has correct number of rows' do
    before do
      visit admin_panel_easter_eggs_path
    end

    it { expect(page.find_all('.js-table-row').count).to eq EasterEgg.count }
  end

  describe 'Edit action is present' do
    before do
      visit admin_panel_easter_eggs_path
    end

    it { expect(page.has_css?('.action-edit')).to be true }
  end
end
