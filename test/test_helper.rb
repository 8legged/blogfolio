require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'turn/autorun'

require 'minitest/pride'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_user(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Sign in"
  end

  def new_comment
    sign_in_user(users(:king))
    visit post_path(posts(:cr))
    save_and_open_page
    click_on "Add comment"
    fill_in :comment_author,        with: comments(:comm_u).author
    fill_in :comment_author_url,    with: comments(:comm_u).author_url
    fill_in :comment_author_email,  with: comments(:comm_u).author_email
    fill_in :comment_content,       with: comments(:comm_u).content
  end
end

Turn.config.format = :outline
