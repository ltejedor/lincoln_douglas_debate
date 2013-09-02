class Round < ActiveRecord::Base
  attr_accessible :kind #unpowered prelim, powered prelim, octofinal, quarterfinal, semifinal, final
  attr_accessible :order, :brackets_attributes
  belongs_to :division
  has_many :round_brackets
  has_many :brackets, :through => :round_brackets, :dependent => :delete_all
  accepts_nested_attributes_for :brackets, allow_destroy: true

  # TODO: be able to add a round out of order and place in order.

end
