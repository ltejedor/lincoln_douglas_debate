class PagesController < ApplicationController
  def about

  end

  def home

    if session[:user_id].nil?
      @signed_in = false
    else
      @signed_in = true
      @user = User.find_by_id(session[:user_id])

    end

  end



end
