class Bracket < ActiveRecord::Base
  attr_accessible :starttime, :name
  has_many :matches
  belongs_to :round
  
end
