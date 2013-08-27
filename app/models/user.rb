class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :googleplus, 
                  :image, :last_name, :name, :provider, :uid, :verified_email
  
  
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end
  
  
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.email = auth["info"]["email"]
      user.verified_email = auth["info"]["email"]
      user.name = auth["info"]["name"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.image = auth["info"]["image"]
      user.googleplus = auth["info"]["urls"]["Google"]
      # TODO: Format birthday, use later for something (e.g., free credits)
      user.birthday = auth["extra"]["raw_info"]["birthday"]
    end
  end
  
  private
  
  def signed_in?
    return true if self.id == session[:user_id]
  end
  
end
