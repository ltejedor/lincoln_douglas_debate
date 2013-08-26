require 'spec_helper'

feature "Creating cards" do
	before do
		Factory(:topic, :name => "Something Cool")
		visit '/topics'
		click_link "Something Cool"
		click_link "New Evidence Card"
	end

	scenario "Creating an evidence card" do
		fill_in "Title", :with => "Evidence for cool"
		fill_in "Description", :with => "An overview of rad"
		click_button "Create Card"
		page.should have_content("Evidence Card has been created.")
	end

	scenario "Creating an evidence card without valid attributes fails" do
		click_button "Create Card"
		page.should have_content("Evidence Card has not been created.")
		page.should have_content("Title can't be blank")
		page.should have_content("Description can't be blank")
	end

	scenario "Creating a card with an attachment" do
		fill_in "Title", :with => "Evidence for rad"
		fill_in "Description", :with => "Check out my cat pics for your catbates"
		attach_file "File #1", "spec/fixtures/cats.txt"
		attach_file "File #2", "spec/fixtures/cutecats.txt"
		attach_file "File #3", "spec/fixtures/hamsters.txt"
		click_button "Create Card"
		page.should have_content("Evidence Card has been created.")
		within("#card .assets") do
			page.should have_content("cats.txt")
			page.should have_content("cutecats.txt")
			page.should have_content("hamsters.txt")
		end
	end

end