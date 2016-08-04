# frozen_string_literal: true
require 'simplecov'
require 'codecov'

if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start { add_filter '/spec/' }
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'spec_helper'
require 'webmock/rspec'
require 'capybara/rspec'

# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = 'tmp/rspec_examples.txt'
  config.order = :random
end

WebMock.disable_net_connect!(allow_localhost: true)
