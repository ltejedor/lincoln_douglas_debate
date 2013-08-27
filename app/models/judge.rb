class Judge < ActiveRecord::Base
  attr_accessible :paradigm
  belongs_to :user
  has_and_belongs_to_many :matches
  has_and_belongs_to_many :rounds
  has_and_belongs_to_many :tournaments
end
