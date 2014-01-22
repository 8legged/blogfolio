require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do

  scenario "adding a new project" do

    # Given a completed new post form
    visit new_project_path
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"

    # When I submit the form
    click_on "Create Project"

    # Then a new post should be created and displayed
    page.text.must_include "Project has been created"
    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Rails"
  end


  scenario "new project has invalid data" do

    # Given invalid project data is entered in a form
    visit new_project_path
    fill_in "Name", with: "Q"

    # When the form is submitted with a short name and missing the technologies_used field
    click_on "Create Project"

    # Then the form should be displayed again, with an error message
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end

end
