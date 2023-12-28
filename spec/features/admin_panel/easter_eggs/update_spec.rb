# frozen_string_literal: true

RSpec.describe 'Easter egg update page' do
  before do
    page.driver.browser.authorize(Rails.application.credentials.dig(:admin_panel, :name),
                                  Rails.application.credentials.dig(:admin_panel, :password))
    easter_egg = create(:easter_egg)
    visit edit_admin_panel_easter_egg_path(easter_egg)
  end

  describe 'Reaching edit page' do
    it { expect(status_code).to be(200) }
  end

  describe 'Easter egg edit page shows correct fields' do
    it { expect(page.has_css?('#easter_egg_latitude')).to be true }
    it { expect(page.has_css?('#easter_egg_longitude')).to be true }
    it { expect(page.has_css?('#easter_egg_clue')).to be true }
  end

  describe 'Easter egg edit page has update button' do
    it { expect(page).to have_selector(:link_or_button, 'Update Easter egg') }
  end

  describe 'Easter egg edit page shows validation errors' do
    before do
      fill_in('easter_egg_latitude', with: '-95')
      fill_in('easter_egg_longitude', with: attributes_for(:easter_egg)[:longitude])
      click_button('Update Easter egg')
    end

    it { expect(page.has_css?('.flash-alert')).to be true }
  end

  describe 'Redirect after edit' do
    before do
      fill_in('easter_egg_latitude', with: attributes_for(:easter_egg)[:latitude])

      click_button('Update Easter egg')
    end

    it { expect(page).to have_current_path(admin_panel_easter_egg_path(EasterEgg.last)) }
  end
end
