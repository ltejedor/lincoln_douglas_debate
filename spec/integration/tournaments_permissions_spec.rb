require 'spec_helper'

feature 'Managing Tournament Permissions' do
  let!(:tournament) { Factory(:tournament) }

  scenario 'cannot create a tournament without having signed in' do

    visit new_tournament_path
    page.should have_content('Sign in to create a tournament')
  end  


end
