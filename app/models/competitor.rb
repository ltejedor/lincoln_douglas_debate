class Competitor < ActiveRecord::Base
  # attr_accessible :rank, :record # record is an array of 1s (wins) and 0s (losses), indexed by round order
  belongs_to :debater
  belongs_to :tournament
end