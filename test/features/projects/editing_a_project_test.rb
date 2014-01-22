require "test_helper"

feature "As the site owner, I want to update a project to correct mistakes" do
  scenario "edit an existing project" do

  visit edit_project_path(projects(:portfolio))

  # When I submit invalid changes
  fill_in "Name", with: "My Rad Portfolio"
  click_on "Update Project"

  # Then the change should not be saved and I should get to try again
  page.text.must_include "Success"
  page.text.must_include "Rad Portfolio"
  page.text.wont_include "Code Fellows Portfolio"
  end

  scenario "incorrectly editing an existing project" do
    visit edit_project_path(projects(:portfolio))
    fill_in "Name", with: "Err"
    click_on "Update Project"

    page.text.must_include "prohibited"
    page.text.must_include "Name is too short"
  end

end
