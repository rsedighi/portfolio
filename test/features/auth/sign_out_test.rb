require "test_helper"

feature ("As a site user I want to be able to sign out from the site") do
  scenario "sign out" do
  visit "/"
  click_on "Sign In"

  fill_in "Email", with: users(:mehvish).email
  fill_in "Password", with: 'password'
  click_on "Sign in"

  page.must_have_content "Signed in successfully"
  page.wont_have_content "Sign out failed"



  click_on "Sign Out"


    # Then I should be signed out

    page.must_have_content "Signed out successfully"
    page.wont_have_content "There was a problem logging you out"
  end
end

