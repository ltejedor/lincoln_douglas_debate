class Debater < ActiveRecord::Base
  attr_accessible :level, :side
  belongs_to :user

  has_and_belongs_to_many :matches
  
  has_and_belongs_to_many :tournaments

  def self.create_debater(user)
    @d = create! { |debater| debater.user = user}
    @d
  end
  
  # TODO: for any particular tournament, assign a starting side for their match in the 1st round
  
  # TODO: win, lose, tournament rank, preserving win-loss records per tournament
  
  # TODO: for any particular tournament, pull up a win-loss record
  
  # TODO: Determine side, given match
end
