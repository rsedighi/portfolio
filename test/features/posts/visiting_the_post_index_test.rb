require "test_helper"

feature "Visiting the Post Index" do
  scenario "As a visitor I want to read posts so I can learn from others" do
    # Given existing posts

    # When I visit /posts
    visit posts_path

    #Then the existing posts should be loaded

    page.text.must_include posts(:cr).title
    page.text.must_include posts(:cr).content
  end
end
