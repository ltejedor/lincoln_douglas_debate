require 'spec_helper'

# TODO: Fix sign-in problem: must sign in to create form. How to test with Omniauth?

feature 'Creating Tournaments' do
  before do
    visit '/'
    find('img.signinbutton').click
    page.should have_link "Sign out"
    visit new_tournament_path
  end

  scenario 'can create a tournament' do
    fill_in 'Name', :with => 'Epic Awesome Friggin Tournament'    
    fill_in 'Summary', :with => "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
    click_button "Create Tournament"
    page.should have_content('Tournament was successfully created')
  end
  
  scenario "creating a tournament also assigns the user as the organizer" do
    fill_in 'Name', :with => 'Epic Awesome Friggin Tournament'    
    fill_in 'Summary', :with => "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
    click_button "Create Tournament"
    page.should have_content('Tournament was successfully created by organizer' + current_user.name)
  end


  scenario "cannot create a tournament without a name and Summary" do
    click_button 'Create Tournament'
    page.should have_content("Name can't be blank")
    page.should have_content("Summary can't be blank")
  end
  
  scenario "cannot have a summary longer than 500 characters" do
    fill_in 'Name', :with => "Really long Tournament"
    fill_in 'Summary', :with =>
    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    click_button "Create Tournament"
    page.should have_content("Summary should be less than 500 characters")
    
  end
  
  scenario "cannot create a tournament that starts later than it ends" do
    fill_in 'Name', :with => 'Epic Awesome Friggin Tournament'
    fill_in 'Summary', :with => "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
    
    # select START date and time
    select 'January', :from => 'tournament_start_2i' # month
    select '18', :from => 'tournament_start_3i' #date
    select '2018', :from => 'tournament_start_1i' #year
    select '06 AM', :from => 'tournament_start_4i' #hour
    
    # select END date and time
    select 'January', :from => 'tournament_end_2i' # month
    select '10', :from => 'tournament_end_3i' #date
    select '2018', :from => 'tournament_end_1i' #year
    select '06 AM', :from => 'tournament_end_4i' #hour
    click_button "Create Tournament"
    
    page.should have_content('Start your tournament reasonably earlier than it ends')
  end
  
  scenario "cannot create a tournament that does not start in the future" do 
    fill_in 'Name', :with => 'Epic Awesome Friggin Tournament'
    fill_in 'Summary', :with => "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
    # select START date and time
    select 'January', :from => 'tournament_start_2i' # month
    select '18', :from => 'tournament_start_3i' #date
    select '2013', :from => 'tournament_start_1i' #year
    select '06 AM', :from => 'tournament_start_4i' #hour
    
    # select END date and time
    select 'January', :from => 'tournament_end_2i' # month
    select '10', :from => 'tournament_end_3i' #date
    select '2018', :from => 'tournament_end_1i' #year
    select '06 AM', :from => 'tournament_end_4i' #hour
    click_button "Create Tournament"
    
    page.should have_content('Start your tournament in the future')
    
  end
  
  
  scenario "cannot create tournament that does not end in the future" do

    fill_in 'Name', :with => 'Epic Awesome Friggin Tournament'
    fill_in 'Summary', :with => "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
    # select START date and time
    select 'January', :from => 'tournament_start_2i' # month
    select '18', :from => 'tournament_start_3i' #date
    select '2014', :from => 'tournament_start_1i' #year
    select '06 AM', :from => 'tournament_start_4i' #hour
    
    # select END date and time
    select 'January', :from => 'tournament_end_2i' # month
    select '20', :from => 'tournament_end_3i' #date
    select '2013', :from => 'tournament_end_1i' #year
    select '06 AM', :from => 'tournament_end_4i' #hour
    click_button "Create Tournament"
    
    page.should have_content('End your tournament in the future')
  end    

end