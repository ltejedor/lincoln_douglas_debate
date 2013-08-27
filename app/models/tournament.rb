class Tournament < ActiveRecord::Base
  attr_accessible :description, :image, :name, :asset
  has_attached_file :asset
end
