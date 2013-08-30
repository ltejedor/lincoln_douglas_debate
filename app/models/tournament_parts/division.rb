class Division < ActiveRecord::Base
  attr_accessible :name, :rounds_attributes
  belongs_to :tournament
  has_many :rounds, :dependent => :delete_all
  has_many :judge_registrations # TODO: Figure out cancelation
  has_many :competitors # TODO: Figure out cancelation
  accepts_nested_attributes_for :rounds, allow_destroy: true
  validates :name, :presence => true
  
end
