class Tournament < ActiveRecord::Base
  attr_accessible :description, :image, :name, :asset
  has_attached_file :asset
  
  belongs_to :organizer
  has_and_belongs_to_many :judges
  has_and_belongs_to_many :debaters
  
  has_many :rounds
  
  validates_length_of :description, :maximum => 500, 
      :message => "Description should be less than 500 characters."
end
