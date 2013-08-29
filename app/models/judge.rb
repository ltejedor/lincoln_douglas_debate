class Judge < ActiveRecord::Base
  attr_accessible :paradigm
  belongs_to :user
  has_many :judge_registrations
  has_many :tournaments, :through => :judge_registrations  

  def self.create_judge(user)
    @j = create! { |judge| judge.user = user}
    @j
  end
  
end
