require "test_helper"

feature "Image upload" do
  scenario "can attach an image to my project" do

  sign_in(:author1)

  visit projects_path
  click_link "New Project"




  fill_in "Title", with: "Code Fellows Portfolio"
  fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"
  click_on "Create Project"

  end
end
