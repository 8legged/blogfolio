require "test_helper"

feature "Creating a post" do
  scenario "submit form data to create a new post" do

    # Given a completed new post form
    visit new_post_path
    fill_in "Title", with: posts(:cr).title
    fill_in "Content", with: posts(:cr).content

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:cr).title
  end
end
