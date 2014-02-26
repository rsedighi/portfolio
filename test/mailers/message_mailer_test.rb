require "test_helper"

 feature "Users can go to contacts page" do
  scenario "so they can send me an email" do

  visit new_message_path

  fill_in "Name", with: users(:editor).name
  fill_in "Please leave your email so we can get back to you",  with: users(:editor).email
  fill_in "What's on your mind?", with: posts(:cr).content

  click_on "Create Message"

  page.text.must_include "Message was successfully created"
  page.wont_have_content  "Failed"
end
end
