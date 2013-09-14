class Judge < ActiveRecord::Base
  attr_accessible :paradigm, :experience, :years_judging, :season_judged_no, :experience_comments,
                  :delivery_preference, :delivery_weight, :delivery_dealbreaker, :delivery_comments,
                  :criterion_weight, :criterion_required, :criterion_comments,
                  :final_rebuttals_should_include, :voting_issues_are,
                  :voting_issues_necessity,
                  :jargon_preference, :rebuttal_comments,
                  :decision_paradigm,
                  :evidence_necessity, :decision_comments,
                  :notetaking_preference, :notetaking_comments

  belongs_to :user
  has_many :judge_registrations
  has_many :tournaments, :through => :judge_registrations

  def self.create_judge(user)
    @j = create! { |judge| judge.user = user}
    @j
  end

end
