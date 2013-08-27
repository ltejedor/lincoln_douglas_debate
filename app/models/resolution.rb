class Resolution < ActiveRecord::Base
  attr_accessible :current, :description, :name
  validates :name, :presence => true
end
