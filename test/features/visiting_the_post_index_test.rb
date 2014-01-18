require "test_helper"

feature "Visiting the post index" do
  scenario "with existing posts, show list" do

    # Given existing posts
    Post.create(title: "Becoming a Code Fellow", content: "Means striving for excellence")

    # When I visit /posts
    visit posts_path

    # Then the existing posts should be loaded
    page.text.must_include posts(:spost_2).title
  end
end
