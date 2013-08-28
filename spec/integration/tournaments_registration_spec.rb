require 'spec_helper'



# TODO: restrict permissions for signed-in users only; test with signed in Omniauth user (how?)
# current_user not working

=begin

feature "Registering for tournaments" do
  let!(:tournament) { Factory(:tournament) }
  let!(:user) { Factory(:user) }
  
  before do
    current_user = user
    
    visit tournament_path(tournament)
  end
  
  scenario "register as debater" do
    select 'Novice', from: 'debater_level'
    click_link_or_button 'Register to Debate'  
    page.should have_content('You successfully registered to debate in the Varsity division of this tournament!')
  end
  scenario "cannot RSVP if already RSVP'd" do
    select 'Novice', from: 'debater_level'
    click_link_or_button 'Register to Debate'  
    page.should have_content('You already registered to compete in this tournament.')
    
    
  end

  scenario "cannot register as a debater when registered as a judge" do
    
  end
  scenario "cannot register as a judge when registered as a debater" do
    
  end
  scenario "change rsvp as a judge" do
    
  end
  scenario "change rsvp as a debater" do
    
  end
  scenario "cannot register in Novice when Seasoned Varsity" do
    
  end
end

=end