require 'spec_helper'

feature "Editing Resolutions" do
	before do
		Factory(:resolution, :name => "Blurp (alien)")
		visit "/resolutions"
		click_link "Blurp (alien)"
		click_link "Edit Resolution"
	end

	scenario "Updating a resolution" do
		fill_in "Name", :with => "THE ALIENS ARE HERE"
		click_button "Update Resolution"
		page.should have_content("Resolution has been updated.")
	end

	scenario "Updating a resolution with invalid attributes is baaad" do
		fill_in "Name", :with => ""
		click_button "Update Resolution"
		page.should have_content("Resolution has not been updated.")
	end
end