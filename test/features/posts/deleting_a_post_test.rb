require "test_helper"

feature "Deleting a post" do
  scenario "post is deleted with a click" do
    @post_value= posts(:cr).id
    sign_in_user(users(:editor))
    visit posts_path
    click_link('Destroy', href: "/posts/#{@post_value}")
    page.wont_have_content posts(:cr)
    # visit new_user_session_path
    # fill_in "Email", with: users(:editor).email
    # fill_in "Password", with: "password"
    # click_on "Sign in"


    # Given an existing post
    # Post.create(title: "Becoming a Code Fellow", content: "Means striving for excellence.")
    # @post = @post.id
    # visit posts_path
    # When I click on delete
    # page.find('dom_id(post)').click_on 'Destroy'

    # Then the post is deleted
    # page.wont_have_content "Becoming a Code Fellow"
  end
end
