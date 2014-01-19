require "test_helper"

 # class CheckSiteTest < Capybara::Rails::TestCase
  feature "A public facing site" do
    scenario "has a welcome headline" do
      visit "http://google.com"
      page.text.must_include "Listing posts"
    end
  end


# class CheckSiteTest < Capybara::Rails::TestCase
#   test "sanity" do
#     visit root_path
#     assert_content page, "Hello World"
#     refute_content page, "Goobye All!"
#   end
# end


# require "spec_helper"


