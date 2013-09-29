class ApplicationController < ActionController::Base
  around_filter :user_time_zone, if: :current_user
  before_filter :last_logged_in, if: :current_user

  protect_from_forgery
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



  private

    def user_time_zone(&block)
      Time.use_zone(current_user.time_zone, &block)
    end

    def last_logged_in
      current_user.last_logged_in = Time.now
      current_user.save
    end


end
