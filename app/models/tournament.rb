class Tournament < ActiveRecord::Base
  attr_accessible :description, :image, :name, :asset, :start, :end
  has_attached_file :asset
  
  belongs_to :organizer
  has_and_belongs_to_many :judges
  has_and_belongs_to_many :debaters
  
  has_many :rounds
  
  validates_length_of :description, :maximum => 500, 
      :message => "Description should be less than 500 characters."
  
  validates :start, :end, :name, :description, :presence => true
  
  # TODO: Set time zone settings in Account Settings
  
  # TODO: Localize the datetime of Start and End according to Time Zone
  
  def start_time
    self.start.strftime("%a %b %d %I:%M %p") if self.start
  end
  
  def end_time
    self.end.strftime("%a %b %d, %Y %I:%M %p") if self.end
  end
  
end
