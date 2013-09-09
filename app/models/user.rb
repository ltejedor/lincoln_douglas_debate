class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :googleplus,
                  :image, :last_name, :name, :provider, :uid, :verified_email,
                  :summary, :points, :judge_attributes,
                  :facebook, :twitter, :social_email, :website,
                  :asset, :asset_url,
                  :time_zone
  # TODO: Set time zone settings in Account Settings
  has_attached_file :asset
  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)

  belongs_to :debater
  has_one :judge
  accepts_nested_attributes_for :judge
  belongs_to :organizer

  # Set up permissions: only current user can edit their profile! Authorize

  belongs_to :author, polymorphic: true

  has_many :cards

  # --------------- OMNIAUTH -----------------------

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end


  def self.create_from_omniauth(auth)
    @user = create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.email = auth["info"]["email"]
      user.verified_email = auth["info"]["email"]
      user.name = auth["info"]["name"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.image = auth["info"]["image"]
      user.googleplus = auth["info"]["urls"]["Google"] unless auth["info"]["urls"].nil?
      # TODO: Format birthday, use later for something (e.g., free credits)
      user.birthday = auth["extra"]["raw_info"]["birthday"]
      user.time_zone ='Central Time (US & Canada)'
    end
    if @user.image.blank?
      @user.image = "empty_profile.png"
    end
    @user.save!
    return @user

  end

  # --------------- ORGANIZER -----------------------

  def as_organizer
    Organizer.where(user_id: self.id).first || Organizer.create_organizer(self)
  end


  # TODO: Include organizer-only functions, if any to be delegated



  # --------------- DEBATER -----------------------

  def as_debater
    Debater.where(user_id: self.id).first || Debater.create_debater(self)
  end


  # TODO: Include debater-only functions, if any to be delegated



  # --------------- COMPETITIOR -----------------------

  def as_competitor(tourney)
    Competitor.where(tournament_id: tourney.id,
               debater_id: self.as_debater.id).first
  end


  # --------------- JUDGE -----------------------

  # TODO: how to model judges? Judge registration, rsvp

  def as_judge
    Judge.where(user_id: self.id).first || Judge.create_judge(self)
  end


  # TODO: Include judge-only functions, if any, to be delegated

  # --------------- JUDGE REGISTRATION -----------------------

  def as_judge_registration(tourney)
    JudgeRegistration.where(tournament_id: tourney.id, judge_id: self.as_judge.id).first
  end

end
