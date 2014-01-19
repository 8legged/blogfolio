require "test_helper"

 # class CheckSiteTest < Capybara::Rails::TestCase
  feature "A public facing site" do
    scenario "has a welcome headline" do
      visit "http://google.com"
      page.text.must_include "Listing posts"
    end
  end
