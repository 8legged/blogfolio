# require "test_helper"

# feature "As an author or editor I want to approve comments so that my blog does not have spam comments" do
#   scenario "editor can approve comment" do

#     new_comment
#     sign_in_user(users(:king))
#     visit post_path(posts(:spost_2))

# posts(:cr).title

#     fill_in "Email", with: users(:author).email
#     fill_in "Password", with: "password"
#     click_on "Sign in"

#     # Given an author/editor account
#     sign_in_user(users(:editor))

#     # When I visit the new page
#     visit posts_path

#     # There is a checkbox for published
#     page.must_have_field('Published')

#     # When I submit the form
#     fill_in "Title", with: posts(:cr).title
#     fill_in "Content", with: posts(:cr).content
#     check "Published"
#     click_on "Create Post"

#     # Then the published post should be shown
#     page.text.must_include "Status: Published"
#   end




#   # Given

#   # When

#   # Then

#   end



# end
