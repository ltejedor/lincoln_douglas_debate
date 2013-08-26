require 'spec_helper'

feature "Viewing cards" do
	before do
		coolthing = Factory(:topic, :name => "Cool Thing")
		Factory(:card,
							:topic => coolthing,
							:title => "Notes for coolness",
							:description => "See pictures of cats attached")

		lamething = Factory(:topic, :name => "Lame Thing")
		Factory(:card,
							:topic => lamething,
							:title => "This evidence is bad",
							:description => "Miley can't even twerk")
		visit '/topics'
	end

	scenario "Viewing cards for a given topic" do
		click_link "Cool Thing"
		page.should have_content("Notes for coolness")
		page.should_not have_content("This evidence is bad")

		click_link "Notes for coolness"
		within("#card h2") do
			page.should have_content "Notes for coolness"
		end
		page.should have_content("See pictures of cats attached")
	end
end



