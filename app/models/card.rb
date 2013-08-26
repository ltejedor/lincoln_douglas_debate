class Card < ActiveRecord::Base

  attr_accessible :description, :title
  belongs_to :topic
  validates :title, :presence => true
  validates :description, :presence => true
end
