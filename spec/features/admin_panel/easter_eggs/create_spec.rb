# frozen_string_literal: true

RSpec.describe 'Easter egg create page' do
  before do
    page.driver.browser.authorize(Rails.application.credentials.dig(:admin_panel, :name),
                                  Rails.application.credentials.dig(:admin_panel, :password))
    visit new_admin_panel_easter_egg_path
  end

  describe 'Reaching create page' do
    it { expect(status_code).to be(200) }
  end

  describe 'Easter egg create page shows correct fields' do
    it { expect(page.has_css?('#easter_egg_latitude')).to be true }
    it { expect(page.has_css?('#easter_egg_longitude')).to be true }
    it { expect(page.has_css?('#easter_egg_clue')).to be true }
  end

  describe 'Easter egg create page has create button' do
    it { expect(page).to have_selector(:link_or_button, 'Create Easter egg') }
  end

  describe 'Easter egg create page shows validation errors' do
    before do
      fill_in('easter_egg_latitude', with: '-95')
      click_button('Create Easter egg')
    end

    it { expect(page.has_css?('.flash-alert')).to be true }
  end

  describe 'Redirect after creation' do
    before do
      fill_in('easter_egg_latitude', with: attributes_for(:easter_egg)[:latitude])
      fill_in('easter_egg_longitude', with: attributes_for(:easter_egg)[:longitude])

      click_button('Create Easter egg')
    end

    it { expect(page).to have_current_path(admin_panel_easter_egg_path(EasterEgg.last)) }
  end
end
