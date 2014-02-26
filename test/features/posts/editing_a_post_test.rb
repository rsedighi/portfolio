require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an existing post" do

    sign_in

    # click_on "Create Post"
    visit posts_path
    #Given an existing post

    #When I click edit and submit changed data
    page.find("tbody tr:last").click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    #Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end
end
