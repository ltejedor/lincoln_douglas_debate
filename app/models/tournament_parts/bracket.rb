class Bracket < ActiveRecord::Base
  attr_accessible :name, :starttime, :start_time_string
  belongs_to :division
  validate :format_datetime, :message => 'is incorrectly formatted. Should be in MM/DD/YY HH:MM(AM/PM) format.'

  def start_time
    # TODO: Localize
    self.starttime.strftime("%l:%M %P") if self.starttime
  end

  def start_date
    # TODO: Localize
    self.starttime.strftime("%a %b %-d") if self.starttime
  end


  def format_datetime
    # Load formats
      f1="%m/%d/%Y %H:%M%P" # 08/29/1990 01:30am
      f2="%m/%d/%Y %l:%M%P" # 08/29/1990 1:30am
      f3="%m/%d/%Y %H:%M%p" # 08/29/1990 01:30AM
      f4="%m/%d/%Y %l:%M%p" # 08/28/1990 1:30AM
      f5="%-m/%d/%Y %H:%M%P" # 8/29/1990 01:30am
      f6="%-m/%d/%Y %l:%M%P" # 8/29/1990 1:30am
      f7="%-m/%d/%Y %H:%M%p" # 8/29/1990 01:30AM
      f8="%-m/%d/%Y %l:%M%p" # 8/28/1990 1:30AM
      formats=[f1,f2,f3,f4,f5,f6,f7,f8]
    for i in (0..7)
      begin
      self.starttime = DateTime.strptime(self.start_time_string,formats[i])
      rescue
      end
    end
    errors.add(:start_time_string, "is incorrectly formatted. Format should be in MM/DD/YY HH:MMam or MM/DD/YY HH:MMpm format") if self.starttime.blank?

  end

end
