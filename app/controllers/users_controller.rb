class UsersController < ApplicationController
  # TODO: Allow users to edit their profiles
  before_filter :find_user, :only => [:show, :edit, :update]

  def index
  end

  def edit
    @image = "empty_profile.png" if @user.image.blank?
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
    @image = "empty_profile.png" if @user.image.blank?
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end

  end

  def destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
