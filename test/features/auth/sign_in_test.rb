require 'test_helper'

feature "As a user I want to be able to sign in to access my account"  do
  scenario "the user is signed in" do

  visit new_user_session_path

  fill_in "Email", with: users(:author1).email
  fill_in "Password", with: 'password'
  click_on "Sign in"

  page.must_have_content "Signed in successfully"
  page.wont_have_content "Sign out failed"
  end
end
