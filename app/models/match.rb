class Match < ActiveRecord::Base
  attr_accessible :start, :end
  has_many :competitors
  has_many :judges
  
  belongs_to :round
  
  def aff_debater
    self.debaters.where("side","Affirmative").first
  end
  
  def neg_debater
    self.debaters.where("side","Negative").first
  end
  
end
