require "test_helper"

feature "As the site visitor, I want to see a developer's portfolio" do
  scenario "viewing all objects" do
    visit projects_path
    page.text.must_include "Barnyard Cereal"
    page.text.must_include "Ruby, Rails"
  end
end
