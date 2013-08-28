require 'spec_helper'

feature "Deleting resolutions" do
	scenario "Deleting a resolution" do
		Factory(:resolution, :name => "Blurp (alien)")
		visit "/resolutions/1"
		click_link "Delete Resolution"
		page.should have_content("Resolution has been deleted.")

		visit '/resolutions'
		page.should_not have_content("Blurp (alien)")
	end
end