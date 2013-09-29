class User < ActiveRecord::Base


  attr_accessible :birthday, :email, :first_name, :googleplus,
                  :image, :last_name, :name, :provider, :uid, :verified_email,
                  :summary, :judge_attributes,
                  :facebook, :twitter, :social_email, :website,
                  :asset, :asset_url,
                  :time_zone,

                  :member_since, :last_logged_in,
                  :profile_views, #counts views from OTHER users
                  :location,
                  :rep, :rank,
                  :is_judge, :is_debater, :is_coach, :is_instructor, :is_organizer, :is_contributor,
                  :roles, #adhoc form variable,
                  :ip, :longitude, :latitude


  # TODO: Set time zone settings in Account Settings

  geocoded_by :ip, :latitude => :latitude, :longitude => :longitude
  reverse_geocoded_by :latitude, :longitude do |user, results|
    if geo = results.first
      user.location = geo.city + ', ' + geo.state + ', ' + geo.country
    end
  end
  after_validation :geocode, :reverse_geocode
  has_many :teammates
  has_many :teams, through: :teammates

  scope :recently_joined, lambda { order("created_at").limit(50) }
  has_attached_file :asset
  # TODO: verify file format in image format
  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)

  belongs_to :debater
  has_one :judge
  accepts_nested_attributes_for :judge
  belongs_to :organizer

  # Set up permissions: only current user can edit their profile! Authorize

  belongs_to :author, polymorphic: true

  has_many :cards

  has_many :teams, through: :teammates
  has_many :teammates

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
      user.member_since = Time.now
    end
    if @user.image.blank?
      @user.image = "empty_profile.png"
    end
    @user.save!
    return @user

  end


  # --------------- USER PROFILE VARIABLES ----------

  def roles
    roles = {
        Judge: self.is_judge,
        Debater: self.is_debater,
        Coach: self.is_coach,
        Instructor: self.is_instructor,
        Organizer: self.is_organizer,
        Contributor: self.is_contributor}
    desc = []
    roles.each do |key, value|
      if value
        desc.push(key.to_s)
      end
    end
    return desc.join(", ")
  end

  def joined?(team)
    self.teams.any? {|t| t == team}
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
