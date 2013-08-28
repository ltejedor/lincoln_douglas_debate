class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :googleplus, 
                  :image, :last_name, :name, :provider, :uid, :verified_email
  # TODO: Set time zone settings in Account Settings
  belongs_to :userable, polymorphic: true
  
  belongs_to :debater
  belongs_to :judge
  belongs_to :organizer

  belongs_to :author, polymorphic: true
  
  # --------------- OMNIAUTH -----------------------
  
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

  # --------------- ORGANIZER -----------------------
  
  def as_organizer
    @organizer = Organizer.where(user_id: self.id).first || Organizer.create_organizer(self)
  end
  

  # TODO: Include organizer-only functions, if any to be delegated
  


  # --------------- DEBATER -----------------------

  def as_debater
    @debater = Debater.where(user_id: self.id).first || Debater.create_debater(self)
  end

  
  # TODO: Include debater-only functions, if any to be delegated
  


  # --------------- COMPETITIOR -----------------------
  
  def as_competitor(tourney)
    @competitor = 
    Competitor.where(tournament_id: tourney.id, 
               debater_id: self.as_debater.id)
    @competitor
  end
  
 

  # TODO: Include competitor-only functions, if any to be delegated



  # --------------- JUDGE -----------------------
  
  def as_judge
    @judge = Judge.where(user_id: self.id).first || Judge.create_judge(self)
  end

  
  # TODO: Include judge-only functions, if any, to be delegated
  
  
end
