# frozen_string_literal: true

Capybara.server_host = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
Capybara.server_port = ENV.fetch('PORT') { 3000 }

Capybara.register_driver :selenium_remote do |app|
  url = "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_POST']}/wd/hub"
  opts = { desired_capabilities: :chrome, browser: :remote, url: url }
  Capybara::Selenium::Driver.new(app, opts)
end

Capybara.javascript_driver = :selenium_remote
