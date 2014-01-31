require "test_helper"

 # class CheckSiteTest < Capybara::Rails::TestCase
  feature "A public facing site" do
    scenario "has a welcome headline" do
      visit posts_path
      page.text.must_include "Random Thoughts"
    end
  end
