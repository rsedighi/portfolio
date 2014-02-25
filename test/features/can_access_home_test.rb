require "test_helper"

feature "Visiting the Post Index" do
  scenario "not logged in" do

    #When I visit/posts
    visit posts_path
    page.text.must_include posts(:cr).title
    page.text.must_include posts(:cr).content

    #If user not logged in
    page.text.wont_include "New Post"
end

feature "Visiting the Post Index" do
    scenario "logged in" do
     sign_in(:author1)
     visit posts_path
     page.text.must_include "New Post"
 end
end
end
