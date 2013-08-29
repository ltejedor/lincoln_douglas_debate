require 'spec_helper'

feature 'Commence a Tournament' do
  let!(:tournament) { Factory(:tournament, 
                              :starttime => Time.now,
                              :endtime => 7.days.from_now) }
  let!(:competitor) {Factory(:competitor)}
  before do
    competitor.tournament = tournament
    visit tournament_path(tournament)

  end
  
  # TODO: all messed up. Need to use current_user / omniauth mock to do this. Come back to it later.
  
  scenario 'cannot commence a tournament without having registered' do
  end
  
  scenario 'see tournament commencement as a registered competitor' do
    
  end  


end
