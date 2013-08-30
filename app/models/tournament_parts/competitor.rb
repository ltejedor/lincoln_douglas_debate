class Competitor < ActiveRecord::Base
  # attr_accessible :rank, :record # record is an array of 1s (wins) and 0s (losses), indexed by round order
  belongs_to :debater
  belongs_to :tournament
  belongs_to :division
    
  def self.create_competitor(user,tourney,division)
    @c = create! do |competitor|
      competitor.debater = Debater.where(user_id: user.id).first
      competitor.tournament = tourney
      competitor.division = division
    end
    @c    
  end
  
  def self.pair(config) # config = random or powered (competitors with similar records get paired)
    num_competitors = Competitors.length
    num_matches = (num_competitors / 2).ceil
    matches = []
    num_matches.times do
      match = Match.new
      # create matches related to tournament
      # load into an array
    end
    
    if config == "random"
      
    elsif config == "powered"
      #
    else
      raise ArgumentError
    end
  end
  
end