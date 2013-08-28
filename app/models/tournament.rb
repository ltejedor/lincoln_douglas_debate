class Tournament < ActiveRecord::Base
  attr_accessible :description, :image, :name, :asset, :start, :end
  has_attached_file :asset
  
  belongs_to :organizer
  has_and_belongs_to_many :judges
  has_and_belongs_to_many :debaters
  
  has_many :rounds
  
  validates_length_of :description, :maximum => 500, 
      :message => "Description should be less than 500 characters."
  
  validates :name, :description, :presence => true
  
  validate :ends_after_starting?
  
  # TODO: Set time zone settings in Account Settings
  
  # TODO: Localize the datetime of Start and End according to Time Zone
  
  def start_time
    self.start.strftime("%a %b %d %I:%M %p") if self.start
  end
  
  def end_time
    self.end.strftime("%a %b %d, %Y %I:%M %p") if self.end
  end
  
  def ends_after_starting?
    if self.start > self.end || ((self.end - self.start) / 60) < 5
      errors.add(:start, "your tournament reasonably earlier than it ends")
    end 
  end
end
