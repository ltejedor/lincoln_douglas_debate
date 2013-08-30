class Division < ActiveRecord::Base
  attr_accessible :name
  belongs_to :tournament
  has_many :rounds
  
end
