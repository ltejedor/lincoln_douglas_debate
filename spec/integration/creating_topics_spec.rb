require 'spec_helper'

feature 'Creating Topics' do
	before do
		visit '/topics'
		click_link 'Add Debate Topic'
	end

	scenario 'can create a topic' do
		fill_in 'Name', :with => 'Should we start a question club?'
		fill_in 'Description', :with => "Why can't we make spoons?"
		click_button "Create Topic"
		page.should have_content('Debate Topic has been added.')
	end

	scenario "can not create a project without a name" do
		click_button 'Create Topic'
		page.should have_content("Debate Topic has not been added.")
		page.should have_content("Name can't be blank")
	end
end