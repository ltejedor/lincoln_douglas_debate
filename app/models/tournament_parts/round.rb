class Round < ActiveRecord::Base
  attr_accessible :kind #unpowered prelim, powered prelim, octofinal, quarterfinal, semifinal, final
  attr_accessible :order, :brackets_attributes  
  belongs_to :tournament  
  has_many :brackets, :dependent => :delete_all
  accepts_nested_attributes_for :brackets, allow_destroy: true
  
  # TODO: be able to add a round out of order and place in order.
  
  validates :kind, :presence => true
end
