class UsersController < ApplicationController
  # TODO: Allow users to edit their profiles
  before_filter :find_user, :only => [:show, :edit, :update, :submit_summary, :update_ip]
  after_filter :update_roles, :only => [:update]

  def index
  end

  def edit
    @image = ("empty_profile.png" if @user.image.blank?) || @user.image
  end

  def submit_summary
   @user.update_attributes(summary: params[:summary])
   render nothing: true
  end

  def update_ip
    @user.update_attributes(ip: params[:ip])
    render nothing: true
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "show" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @image = ("empty_profile.png" if @user.image.blank?) || @user.image
    unless @user == current_user
      if @user.profile_views.nil?
        @user.profile_views = 1
      else
        @user.profile_views = @user.profile_views + 1
      end
      @user.save
    end
    respond_to do |format|
      format.html # show.html.erb
    end

  end

  def destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def update_roles
    if @user.is_judge
      @user.as_judge
    end
  end

end
