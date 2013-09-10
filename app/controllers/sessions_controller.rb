class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    auth = env["omniauth.auth"]
      if user.name != auth["info"]["name"]
        user.name = auth["info"]["name"]
        user.first_name = auth["info"]["first_name"]
        user.last_name = auth["info"]["last_name"]
      end
      # Update info if necessary
      if user.image != auth["info"]["image"] && auth["info"]["image"] != ""
        user.image = auth["info"]["image"]
      end
      if user.image.blank?
        user.image = "empty_profile.png"
      end
      if auth["info"]["urls"].nil?
        user.googleplus = ""
      end
      user.save
      session[:user_id] = user.id
    redirect_to root_url

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end



end
