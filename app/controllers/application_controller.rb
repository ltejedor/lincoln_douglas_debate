class ApplicationController < ActionController::Base
  around_filter :user_time_zone, if: :current_user

  protect_from_forgery
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

    def user_time_zone(&block)
      Time.use_zone(current_user.time_zone, &block)
    end


end
