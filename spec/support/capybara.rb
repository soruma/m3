# frozen_string_literal: true

Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  [
    'no-sandbox',
    'headless',
    'window-size=1400x1400',
    'disable-gpu'
  ].each { |arg| options.add_argument(arg) }
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :selenium_chrome_headless
Capybara.default_max_wait_time = 15
