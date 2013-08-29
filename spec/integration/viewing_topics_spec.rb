require 'spec_helper'

feature "Viewing topics" do
	scenario "Listing all topics" do
		topic = Factory.create(:topic, :body => "Plastic Sporks: Moral?")
		visit '/topics'
		page.should have_content("Plastic Sporks: Moral?")
	end
end