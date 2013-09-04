class Match < ActiveRecord::Base
  has_many :competitors
  has_many :judges

  def aff_debater
    self.debaters.where("side","Affirmative").first
  end

  def neg_debater
    self.debaters.where("side","Negative").first
  end

end
