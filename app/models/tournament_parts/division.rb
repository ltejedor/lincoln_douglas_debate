class Division < ActiveRecord::Base
  attr_accessible :name
  belongs_to :tournament
  has_many :rounds
  has_many :judge_registrations
  has_many :competitors
  
end
