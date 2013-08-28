class Case < ActiveRecord::Base
  attr_accessible :anon, :content, :description, :title, :type
  validates :title, :presence => true
  validates :content, :presence => true
end
