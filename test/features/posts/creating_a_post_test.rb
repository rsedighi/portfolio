require "test_helper"

feature "Creating a Post" do
  scenario "submit form data to create a new post" do

    #visit user_session_path
    sign_in

  #Given a completed new post form
  #visit new_user_session_path

  #fill_in "Email", with: users(:mehvish).email
  #fill_in "Password", with: 'password'
  #click_on "Sign in"


  visit new_post_path
  fill_in "Title", with: posts(:cr).title
  fill_in "Content", with: posts(:cr).content

  #When I submit the form
  click_on "Create Post"

  #Then a new post should be created and displayed
  page.text.must_include "Post was successfully created"
  page.text.must_include posts(:cr).title
  page.text.must_include users(:author1).email
  page.text.must_include "Unpublished"

  end

  scenario "authors can't publish" do
    sign_in(:author1)

    visit new_post_path
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    sign_in(:editor)

    visit new_post_path
    page.must_have_field ('Published')

    fill_in "Title", with: posts(:cr).title
    fill_in "Content", with: posts(:cr).content
    check "Published"
    click_on "Create Post"

    page.text.must_include "Published"
  end



  scenario "Visitors should not be able to create posts" do
    visit new_post_path
    page.text.must_include "You need to sign in or sign up before continuing."
  end
end
