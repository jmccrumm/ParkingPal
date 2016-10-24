ENV['RAILS_ENV'] ||= 'test'
#Rake::Task["db:seed"].invoke
Rake::Task["db:test:load"].invoke
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rspec/rails'
#Rails.application.load_seed

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
