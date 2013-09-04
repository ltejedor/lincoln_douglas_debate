class RoundBracket < ActiveRecord::Base
  attr_accessible :starttime
  belongs_to :round
  belongs_to :bracket
end
