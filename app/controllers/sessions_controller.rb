class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    auth = env["omniauth.auth"]
      if user.name != auth["info"]["name"]
        user.name = auth["info"]["name"]
        user.first_name = auth["info"]["first_name"]
        user.last_name = auth["info"]["last_name"]
        user.save
      end
      if user.image != auth["info"]["image"]
        user.image = auth["info"]["image"]
        user.save
      end
      session[:user_id] = user.id
    redirect_to root_url

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end



end
