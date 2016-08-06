# frozen_string_literal: true
require 'capybara/rspec'

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure(&:block_unknown_urls)
