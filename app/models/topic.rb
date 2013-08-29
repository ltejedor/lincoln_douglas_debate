class Topic < ActiveRecord::Base
  attr_accessible :name, :body, :source, :starred

  has_many :cards, :dependent => :delete_all

  validates :body, :presence => true
end
