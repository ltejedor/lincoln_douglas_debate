require 'spec_helper'

feature "Viewing resolutions" do
	scenario "Listing all resolutions" do
		resolution = Factory.create(:resolution, :name => "TESTTTTING ZRBT")
		visit '/resolutions'
		click_link 'TESTTTTING ZRBT'
		page.current_url.should == resolution_url(resolution)
	end
end