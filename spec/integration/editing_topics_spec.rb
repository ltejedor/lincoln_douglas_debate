require 'spec_helper'

feature "Editing Topics" do
	before do
		Factory(:topic, :body => "Why can't we make spoons?")
		visit "/topics"
		click_link "Edit Card"
	end

	scenario "Updating a debate topic" do
		fill_in "Body", :with => "Why is spoon production illegal?"
		click_button "Create Card"
		page.should have_content("Debate Topic has been updated.")
	end

	scenario "Updating a topic with invalid attributes won't work" do
		fill_in "Body", :with => ""
		click_button "Create Card"
		page.should have_content("Debate Topic has not been updated.")
	end
end