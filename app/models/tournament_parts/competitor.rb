class Competitor < ActiveRecord::Base
  attr_accessible :division
  # attr_accessible :rank, :record # record is an array of 1s (wins) and 0s (losses), indexed by round order
  belongs_to :debater
  belongs_to :tournament
  
  validates :division, :presence => true
  
  def self.create_competitor(user,tourney,division)
    @c = create! do |competitor|
      competitor.debater = Debater.where(user_id: user.id).first
      competitor.tournament = tourney
      competitor.division = division
    end
    @c    
  end
  
end