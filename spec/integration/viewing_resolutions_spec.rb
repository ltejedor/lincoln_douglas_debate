require 'spec_helper'

feature "Viewing resolutions" do
	scenario "Listing all resolutions" do
		resolution = Factory.create(:resolution, :name => "TESTTTTING ZRBT")
		visit '/resolutions/1'
		page.current_url.should == resolution_url(resolution)
	end
end