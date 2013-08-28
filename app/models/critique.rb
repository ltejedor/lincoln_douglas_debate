class Critique < ActiveRecord::Base
  belongs_to :case
  attr_accessible :body, :name
  validates :name, :presence => true
  validates :body, :presence => true
end
