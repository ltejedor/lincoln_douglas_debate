require 'spec_helper'



# TODO: restrict permissions for signed-in users only; test with signed in Omniauth user (how?)
# current_user not working


feature "Registering for tournaments" do
  let!(:tournament) { Factory(:tournament) }
  let!(:user) { Factory(:user) }
  
  before do
    
    visit tournament_path(tournament)
  end
  
  pending scenario "register as competitor" do
    select 'Novice', from: 'debater_level'
    click_link_or_button 'Register to Debate'  
    page.should have_content('You successfully registered to debate in the Varsity division of this tournament!')
  end
  pending scenario "cannot RSVP if already RSVP'd" do
    select 'Novice', from: 'debater_level'
    click_link_or_button 'Register to Debate'  
    page.should have_content('You have registered to attend this tournament')
        
  end
  
  pending scenario "can cancel existing RSVP as competitor" do
    select 'Novice', from: 'debater_level'
    click_link_or_button 'Register to Debate'
    click_link_or_button 'Cancel your Registration'
    page.should have_content('You successfully canceled your registration')
  end
  
  pending scenario "can cancel existing RSVP as judge" do
    
  end

  pending scenario "cannot register as a debater when registered as a judge" do
    
  end
  pending scenario "cannot register as a judge when registered as a competitor" do
    
  end
  pending scenario "cannot register in Novice when Seasoned Varsity" do
    
  end
end
