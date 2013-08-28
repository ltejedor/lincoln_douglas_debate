class Case < ActiveRecord::Base
  attr_accessible :anon, :content, :description, :title, :response_type
  validates :title, :presence => true
  validates :content, :presence => true

  has_many :critiques, :dependent => :delete_all
end
