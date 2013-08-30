class JudgeRegistration < ActiveRecord::Base
  belongs_to :judge
  belongs_to :tournament
  belongs_to :division


  def self.create_judge_registration(user,tourney,division)
    @jr = create! do |jr|
      jr.judge = Judge.where(user_id: user.id).first
      jr.tournament = tourney
      jr.division = division
    end
    @jr
  end
    
end
