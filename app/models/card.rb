class Card < ActiveRecord::Base

  attr_accessible :description, :title, :asset
  belongs_to :topic
  validates :title, :presence => true
  validates :description, :presence => true
	has_attached_file :asset
end
