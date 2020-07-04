# frozen_string_literal: true

SimpleCov.start 'rails' do
  add_filter do |source_file|
    source_file.lines.count < 7
  end
end

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end
