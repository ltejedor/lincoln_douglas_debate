class Round < ActiveRecord::Base
  attr_accessible :order
  
  belongs_to :tournament
  
  has_many :matches
  
  has_and_belongs_to_many :judges
end
