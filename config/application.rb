require_relative 'boot'

require 'rails/all'

require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # locale
    config.time_zone = 'Tokyo'
    config.i18n do |i|
      i.available_locales = %i(ja en)
      i.enforce_available_locales = true
      i.default_locale = :en
    end

    config.generators do |g|
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.test_framework :rspec,
        fixture: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
