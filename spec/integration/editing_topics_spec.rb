require 'spec_helper'

feature "Editing Topics" do
	before do
		Factory(:topic, :name => "Why can't we make spoons?")
		visit "/topics"
		click_link "Why can't we make spoons?"
		click_link "Edit Debate Topic"
	end

	scenario "Updating a debate topic" do
		fill_in "Name", :with => "Why is spoon production illegal?"
		click_button "Update Topic"
		page.should have_content("Debate Topic has been updated.")
	end

	scenario "Updating a topic with invalid attributes won't work" do
		fill_in "Name", :with => ""
		click_button "Update Topic"
		page.should have_content("Debate Topic has not been updated.")
	end
end