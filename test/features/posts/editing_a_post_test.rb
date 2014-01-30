require "test_helper"

feature "Editing a post" do
  scenario "submit updates to an existing post" do

    visit new_user_session_path

    fill_in "Email", with: users(:author).email
    fill_in "Password", with: "password"
    click_on "Sign in"

    visit new_post_path
    fill_in "Title", with: posts(:cr).title
    fill_in "Content", with: posts(:cr).content

    click_on "Create Post"

    # Given an existing post
    # post = Post.create(title: "Becoming a Code Fellow", content: "Means striving for excellence.")
    # visit post_path(post)

    # When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end
end
