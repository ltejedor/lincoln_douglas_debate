class Topic < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :cards, :dependent => :delete_all

  validates :name, :presence => true
end
