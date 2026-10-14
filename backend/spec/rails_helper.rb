ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rspec/rails"
RSpec.configure { |config| config.use_transactional_fixtures = true }
