require 'spec_helper'

feature "Deleting Topics" do
	scenario "Deleting a topic" do
		Factory(:topic, :name => "What happens on the night train?")
		visit "/topics"
		click_link "What happens on the night train?"
		click_link "Delete Debate Topic"
		page.should have_content("Debate Topic has been deleted.")

		visit "/topics"
		page.should_not have_content("What happens on the night train?")
	end
end