class Topic < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :cards

  validates :name, :presence => true
end
