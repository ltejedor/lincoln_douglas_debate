class Judge < ActiveRecord::Base
  attr_accessible :paradigm, :experience, :years_judging, :season_judged_no,
                  :delivery_preference, :delivery_weight, :delivery_dealbreaker,
                  :criterion_weight, :criterion_required,
                  :final_rebuttals_should_include, :voting_issues_are,
                  :voting_issues_necessity,
                  :jargon_preference,
                  :decision_paradigm,
                  :evidence_necessity,
                  :notetaking_preference

  belongs_to :user
  has_many :judge_registrations
  has_many :tournaments, :through => :judge_registrations

  def self.create_judge(user)
    @j = create! { |judge| judge.user = user}
    @j
  end

end
