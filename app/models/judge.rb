class Judge < ActiveRecord::Base
  attr_accessible :paradigm
  belongs_to :user
  has_and_belongs_to_many :matches
  has_and_belongs_to_many :rounds
  has_many :tournaments, :through => :tournament_debaters
  
  def self.create_judge(user)
    @j = create! { |judge| judge.user = user}
    @j
  end
  
end
