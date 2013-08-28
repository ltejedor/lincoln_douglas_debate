class Tournament < ActiveRecord::Base
  attr_accessible :description, :image, :name, :asset, :starttime, :endtime,
      :summary, :entry_info, :divisions_info, :rules_info, :judges_info, :additional_info
  has_attached_file :asset
  
  belongs_to :organizer
  has_many :judges, :through => :tournament_judges
  has_many :competitors
  
  has_many :rounds

  validates :name, :summary, :presence => true  
  validates_length_of :summary, :maximum => 500, 
      :message => "should be less than 500 characters."
  
  
  validate :ends_after_starting?
  validate :starts_and_ends_in_future?  
  
  # TODO: Each tournament should be attached to a resolution.
  
  # TODO: Set time zone settings in Account Settings
  
  # TODO: Localize the datetime of Start and End according to Time Zone
  
  def start_time
    self.starttime.strftime("%a %b %d %I:%M %p") if self.starttime
  end
  
  def end_time
    self.endtime.strftime("%a %b %d, %Y %I:%M %p") if self.endtime
  end
  
  def ends_after_starting?
    if self.starttime > self.endtime || ((self.endtime - self.starttime) / 60) < 5
      errors.add(:starttime, "your tournament reasonably earlier than it ends")
    end 
  end
  
  def starts_and_ends_in_future?
    if self.starttime < Time.now
      errors.add(:starttime, "your tournament in the future")
    elsif self.endtime < Time.now
      errors.add(:endtime, "your tournament in the future")
    end
  end
  
  def self.upcoming
    @upcoming = []
    for tournament in Tournament.all
      @upcoming.push(tournament) if tournament.starttime > Time.now
    end
    @upcoming
  end
end
