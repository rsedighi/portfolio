require "test_helper"

feature "Visiting the Post Index" do
  scenario "the test is sound" do
    visit root_path
    page.must_have_content "Welcome to Ramin's"
    page.wont_have_content "Goobye All!"
  end
end
