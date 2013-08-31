class Bracket < ActiveRecord::Base
  attr_accessible :name
  has_many :rounds, :through => :round_brackets

  def start_time
    # TODO: Localize
    self.starttime.strftime("%I:%M %p") if self.starttime
  end

  def start_date
    # TODO: Localize
    self.starttime.strftime("%a %b %d") if self.starttime
  end

end
