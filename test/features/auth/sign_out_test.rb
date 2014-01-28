require "test_helper"

feature "As a User
        I want to be able to sign out of my account
        so that I can destroy my session." do
  scenario "sign out" do
    # Given a current user
    visit new_user_session_path
    fill_in "Email", with: users(:king).email
    # fill_in "Password", with: users(:king).password
    fill_in "Password", with: "password"
    click_on "Sign in"
    page.must_have_content "Signed in successfully."
    page.must_have_content "Sign Out"
    # When I register with valid info
    click_on "Sign Out"

    # Then I should be signed up
    page.must_have_content "Signed out successfully"
    page.wont_have_link "Sign in"
  end
end
