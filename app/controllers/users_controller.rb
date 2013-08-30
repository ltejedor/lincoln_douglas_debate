class UsersController < ApplicationController
  # TODO: Allow users to edit their profiles
  before_filter :find_user, :only => [:show, :edit, :update]
  
  def index
  end

  def edit
  end

  def update
  end

  def show
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tournament }
    end
    
  end

  def destroy
  end
  
  private
  
  def find_user
    @user = User.find(params[:id])
  end
  
end
