require 'spec_helper'

feature 'Creating Topics' do
	scenario 'can create a topic' do
		visit '/topics'
		click_link 'Add Debate Topic'
		fill_in 'Name', :with => 'Should we start a question club?'
		fill_in 'Description', :with => "Why can't we make spoons?"
		click_button "Create Topic"
		page.should have_content('Debate Topic has been added.')
	end
end