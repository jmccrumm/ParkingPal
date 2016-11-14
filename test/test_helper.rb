ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rspec/rails'
require 'rake'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all

  Rake::Task["db:test:load"].invoke
  ActiveRecord::Migration.maintain_test_schema!

  Cucumber.configure do |config|
	config.before(:each) do
  		Rails.application.load_seed # loading seeds
  		Rake::Task['db:test:load'].execute
	end
  end
  # Add more helper methods to be used by all tests here...
end
