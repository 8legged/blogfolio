require "test_helper"

feature "Creating a post" do
  scenario "unauthenticated site vistiors cannot see new post button" do

    # When I visit the blog index page
    visit posts_path

    # Then I should not see the "New Post" button
    page.wont_have_link "New Post"
  end

  scenario "submit form data to create a new post" do

    # Given a completed new post form
    sign_in_user(users(:author))
    visit new_post_path
    fill_in "Title", with: posts(:cr).title
    fill_in "Content", with: posts(:cr).content

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:cr).title
    page.text.must_include "Unpublished"
  end

  scenario "authors can't publish" do
    # Given an author's account
    sign_in_user(users(:author))

    # When I visit the new page
    visit new_post_path

    # There is no checkbox for published
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    # Given an editor's account
    sign_in_user(users(:editor))

    # When I visit the new page
    visit new_post_path

    # There is a checkbox for published
    page.must_have_field('Published')

    # When I submit the form
    fill_in "Title", with: posts(:cr).title
    fill_in "Content", with: posts(:cr).content
    check "Published"
    click_on "Create Post"

    # Then the published post should be shown
    page.text.must_include "Published"
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    visit new_post_path
    page.text.must_include "You need to sign in or sign up before continuing."
  end


end





