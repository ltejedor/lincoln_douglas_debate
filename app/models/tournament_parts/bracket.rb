class Bracket < ActiveRecord::Base
  attr_accessible :starttime, :name
  has_many :matches
  belongs_to :round

  def start_time
    # TODO: Localize
    self.starttime.strftime("%I:%M %p") if self.starttime
  end

  def start_date
    # TODO: Localize
    self.starttime.strftime("%a %b %d") if self.starttime
  end

end
