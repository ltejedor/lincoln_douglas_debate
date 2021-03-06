class Tournament < ActiveRecord::Base
  attr_accessible :description, :image, :name, :asset, :starttime, :endtime, :asset_url,
      :summary, :entry_info, :divisions_info, :rules_info, :judges_info, :additional_info,
      :divisions_attributes
  has_attached_file :asset

  belongs_to :organizer
  has_many :judge_registrations # TODO: Figure out cancelation
  has_many :competitors #TODO: Figure out cancelation
  has_many :divisions, :dependent => :delete_all

  accepts_nested_attributes_for :divisions,
  allow_destroy: true, :reject_if => lambda { |d| d[:name].blank? }

  validates :name, :summary, :presence => true
  validates_length_of :summary, :maximum => 500,
      :message => "should be less than 500 characters."


  validate :ends_after_starting?
  validate :starts_and_ends_in_future?, :on => :create # allow user to edit tournament schedule mid-tournament

  # TODO: Each tournament should be attached to a resolution.

  # TODO: Set time zone settings in Account Settings

  # TODO: Localize the datetime of Start and End according to Time Zone

  def start_time
      self.starttime.strftime("%a %b %-d, %Y at %l:%M%p")
  end

  def end_time
      self.endtime.in_time_zone.strftime("%a %b %-d, %Y at %l:%M%p")
  end

  def ends_after_starting?
    if self.starttime > self.endtime || ((self.endtime - self.starttime) / 60) < 5
      errors.add(:starttime, "Start your tournament reasonably earlier than it ends")
    end
  end

  def starts_and_ends_in_future?
    if self.starttime < Time.now
      errors.add(:starttime, "Start time of your tournament must be in the future")
    elsif self.endtime < Time.now
      errors.add(:endtime, "End time of your tournament must be in the future")
    end
    # TODO: Fix error messages as they appear
  end

  def self.upcoming
    @upcoming = []
    for tournament in Tournament.all
      @upcoming.push(tournament) if tournament.starttime > Time.now
    end
    @upcoming.sort! {|a,b| a.starttime <=> b.starttime}
  end

  def self.current
    @current = []
    for tournament in Tournament.all
      @current.push(tournament) if (tournament.starttime <= Time.now && tournament.endtime >= Time.now )
    end
    @current.sort! {|a,b| a.starttime <=> b.starttime}
  end

  def self.past
    @past = []
    for tournament in Tournament.all
      @past.push(tournament) if tournament.endtime <= Time.now
    end
    @past.sort! {|a,b| a.starttime <=> b.starttime}
  end



end
