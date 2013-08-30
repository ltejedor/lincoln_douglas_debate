require 'spec_helper'

feature "Deleting Topics" do
	scenario "Deleting a topic" do
		Factory(:topic, :body => "What happens on the night train?")
		visit "/topics"
		click_link "Delete Card"
		page.should have_content("Card has been deleted.")

		visit "/topics"
		page.should_not have_content("What happens on the night train?")
	end
end