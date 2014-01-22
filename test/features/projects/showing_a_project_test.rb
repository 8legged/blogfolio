require "test_helper"

feature "As the site visitor, I want to see a developer's app" do
  scenario "viewing a project" do
    visit project_path(projects(:freelance))
    page.text.must_include "Barnyard Cereal"
    page.text.must_include "Automilker"
  end
end
