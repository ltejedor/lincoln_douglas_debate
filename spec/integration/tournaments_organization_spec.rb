require 'spec_helper'

feature 'Organize a Tournament' do

  scenario 'cannot create a tournament without having signed in' do
    visit new_tournament_path
    page.should have_content('Sign in to create a tournament')
  end  


end
