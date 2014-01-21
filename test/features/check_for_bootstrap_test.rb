require "test_helper"

feature "Check for Bootstrap" do
  scenario "bootstrap works fine" do
    visit root_path
    assert page.has_css? ".navbar"
  end
end
