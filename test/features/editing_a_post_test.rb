require "test_helper"

feature "Editing a post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    post = Post.create(title: "Becoming a Code Fellow", content: "Means striving for excellence.")
    visit post_path(post)

    # When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end
end
