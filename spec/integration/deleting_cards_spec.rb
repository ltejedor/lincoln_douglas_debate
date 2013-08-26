require 'spec_helper'

feature 'Deleting cards' do
	let!(:topic) { Factory(:topic) }
	let!(:card) { Factory(:card, :topic => topic) }

	before do
		visit '/topics'
		click_link topic.name
		click_link card.title
	end

	scenario "Deleting a card" do
		click_link "Delete Evidence Card"
		page.should have_content("Evidence Card has been deleted.")
		page.current_url.should == topic_url(topic)
	end

end
