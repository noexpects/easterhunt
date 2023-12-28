# frozen_string_literal: true

require 'capybara/rspec'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-gpu')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1366,720')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options:)
end

Capybara.server = :puma, { Silent: true }
