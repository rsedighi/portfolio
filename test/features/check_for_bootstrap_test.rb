require "test_helper"

feature "Check for Bootstrap" do
  scenario "on root_path" do
    visit root_path
    assert page.has_css? ".navbar"
  end

  feature "Check for Bootstrap" do
    scenario "on post_path" do
      visit posts_path
      assert page.has_css? ".navbar"
    end
  end
end
