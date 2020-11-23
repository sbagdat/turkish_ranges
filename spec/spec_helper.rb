# frozen_string_literal: true

require 'bundler/setup'
require 'turkish_ranges'
require 'turkish_ranges/tr_text'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
