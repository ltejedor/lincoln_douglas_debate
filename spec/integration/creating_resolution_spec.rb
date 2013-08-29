require 'spec_helper'

feature 'Creating Resolutions' do
	scenario "can create a resolution" do
		visit '/resolutions'
		click_link 'Add Resolution'
		fill_in 'Name', :with => 'Fake Resolution'
		click_button 'Create Resolution'
		page.should have_content('Resolution has been created.')
	end
end