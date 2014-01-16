require "test_helper"

feature "CanAccessHome" do
  scenario "Welcome page" do
    visit root_path
    page.must_have_content "Welcome to Ramin's static Rails BDD page."
    page.wont_have_content "Goobye All!"
  end
end
