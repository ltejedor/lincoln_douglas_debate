class Round < ActiveRecord::Base
  attr_accessible :type #prelim, bye, octofinal, quarterfinal, semifinal, final
  attr_accessible :subtype #powered, unpowered, outround
  attr_accessible :order  
  belongs_to :tournament  
  has_many :brackets
  
  has_and_belongs_to_many :judges # TODO: Allow judges to judge specific rounds?
end
