class Judge < ActiveRecord::Base
  attr_accessible :paradigm, :level
  belongs_to :user
  has_and_belongs_to_many :matches
  has_and_belongs_to_many :rounds
  has_many :tournaments, through: :tournament_debaters
  validates :levels, presence: true
  def self.create_judge(user)
    @j = create! { |judge| judge.user = user}
    @j
  end
  
end
