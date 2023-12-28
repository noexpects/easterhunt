# frozen_string_literal: true

RSpec.describe 'Easter egg show page' do
  before do
    page.driver.browser.authorize(Rails.application.credentials.dig(:admin_panel, :name),
                                  Rails.application.credentials.dig(:admin_panel, :password))
    easter_egg = create(:easter_egg, hunter:, revealed: true)

    visit admin_panel_easter_egg_url(easter_egg)
  end

  let(:hunter) { create(:hunter) }

  describe 'Reaching show page' do
    it { expect(status_code).to be(200) }
  end

  describe 'Easter egg show page has correct attributes' do
    it { expect(page.has_css?('#id')).to be true }
    it { expect(page.has_css?('#latitude')).to be true }
    it { expect(page.has_css?('#longitude')).to be true }
    it { expect(page.has_css?('#code')).to be true }
    it { expect(page.has_css?('#clue')).to be true }
    it { expect(page.has_css?('#revealed')).to be true }
    it { expect(page.has_css?('#created_at')).to be true }
    it { expect(page.has_css?('#hunter')).to be true }
  end

  describe 'Easter egg show page shows hunter revealed egg' do
    it { expect(page.has_text?(hunter.email)).to be true }
  end

  describe 'Easter egg show page has edit button' do
    it { expect(page).to have_selector(:link_or_button, 'Edit EasterEgg') }
  end
end
