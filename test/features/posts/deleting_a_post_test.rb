require "test_helper"

feature "Deleting a post" do
  scenario "post is deleted with a click" do

    visit new_user_session_path

    fill_in "Email", with: users(:author).email
    fill_in "Password", with: "password"
    click_on "Sign in"

    # Given an existing post
    Post.create(title: "Becoming a Code Fellow", content: "Means striving for excellence.")
    visit posts_path

    # When I click on delete
    page.find('tbody tr:last').click_on 'Destroy'

    # Then the post is deleted
    page.wont_have_content "Becoming a Code Fellow"
  end
end
