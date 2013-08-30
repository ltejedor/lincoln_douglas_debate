class Division < ActiveRecord::Base
  attr_accessible :name, :rounds_attributes
  belongs_to :tournament
  has_many :rounds
  has_many :judge_registrations
  has_many :competitors
  accepts_nested_attributes_for :rounds, allow_destroy: true
  validates :name, :presence => true
  
end
