class Card < ActiveRecord::Base

  attr_accessible :description, :title, :assets_attributes
  belongs_to :topic

  validates :title, :presence => true
  validates :description, :presence => true

	has_many :assets, :dependent => :delete_all
	accepts_nested_attributes_for :assets
end
