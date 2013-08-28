require 'spec_helper'

feature 'Creating Cases' do
	before do
		Factory(:resolution, :name => "Name of")
		visit '/resolutions/1'
		click_link "Submit Case for Review"
	end

	scenario "Creating a case" do
		fill_in "Title", :with => "I am never leaving this place"
		fill_in "Content", :with => "This is not a real case. I don't know how to debate."
		click_button "Create Case"
		page.should have_content("Case has been created.")
	end

	scenario "Creating a case without valid attributes fails" do
		click_button "Create Case"
		page.should have_content("Case has not been created")
		page.should have_content("Title can't be blank")
		page.should have_content("Content can't be blank")
	end
end