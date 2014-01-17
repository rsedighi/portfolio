require "test_helper"

feature "Deleting a post" do
  scenario "post is deleted with a click" do
    #Given an existing post
    post = Post.create(title: "Becoming a Code Fellow", content: "Means striving for excellence.")
    visit posts_path

    #When the delete link is clicked
    page.find("tbody tr:last").click_on "Destroy"

    #Then the post is deleted
    page.wont_have_content "Becoming a Code Fellow"
  end
end
