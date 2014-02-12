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

 scenario "sign in with twitter works" do
   visit root_path
   click_on "Sign In"
   OmniAuth.config.test_mode = true
   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
   OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
   click_on "Sign in with Twitter"
   page.must_have_content "you are signed in!"
  end
end
