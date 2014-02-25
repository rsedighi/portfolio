require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do

    sign_in(:author1)

    visit projects_path
    click_on "New Project"
    fill_in "Title", with: projects(:project).title
    fill_in "Technologies used", with: projects(:project).technologies_used
    click_on "Create Project"
    page.text.must_include "Project has been created"
  end
end
