# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails'

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end
