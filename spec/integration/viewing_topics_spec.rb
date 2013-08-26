require 'spec_helper'

feature "Viewing topics" do
	scenario "Listing all topics" do
		topic = Factory.create(:topic, :name => "Plastic Sporks: Moral?")
		visit '/topics'
		click_link 'Plastic Sporks: Moral?'
		page.current_url.should == topic_url(topic)
	end
end