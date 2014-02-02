ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "turn/autorun"
require "simplecov"
SimpleCov.start 'rails'

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all
end
  def sign_in(role = :editor)
    visit new_user_session_path
    fill_in "Email", with: users(role).email
    fill_in "Password", with: "password"
    click_on "Sign in"
  end
  # Add more helper methods to be used by all tests here...


class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
#  include Capybara::RSpcMatchers
  include Capybara::DSL
end

