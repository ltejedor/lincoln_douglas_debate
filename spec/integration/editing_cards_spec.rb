require 'spec_helper'

feature 'Editing cards' do
	let!(:topic) { Factory(:topic) }
	let!(:card) { Factory(:card, :topic => topic) }

	before do
		visit '/topics'
		click_link topic.name
		click_link card.title
		click_link "Edit Evidence Card"
	end

	scenario "Updating a card" do
		fill_in "Title", :with => "Replacement title"
		click_button "Update Card"
		page.should have_content "Evidence Card has been updated."
		within("#card h2") do
			page.should have_content("Replacement title")
		end
		page.should_not have_content card.title
	end

		scenario "Updating a card with invalid information is bad" do
			fill_in "Title", :with => ""
			click_button "Update Card"
			page.should have_content("Evidence Card has not been updated.")
		end
	end
