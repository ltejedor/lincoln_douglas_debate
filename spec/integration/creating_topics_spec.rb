require 'spec_helper'

feature 'Creating Topics' do
	before do
		visit '/topics'
		click_link 'New Card'
	end

	scenario 'can create a topic' do
		fill_in 'Body', :with => 'Should we start a question club?'
		click_button "Create Card"
		page.should have_content('Card has been added.')
	end

	scenario "can not create a project without a name" do
		click_button 'Create Card'
		page.should have_content("Card has not been added.")
		page.should have_content("Body can't be blank")
	end
end