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
  
  def paradigm_blank?
    paradigm_fields = [
        self.paradigm, self.experience, self.years_judging, self.season_judged_no, self.experience_comments,
        self.delivery_preference, self.delivery_weight, self.delivery_dealbreaker, self.delivery_comments,
        self.criterion_weight, self.criterion_required, self.criterion_comments,
        self.final_rebuttals_should_include, self.voting_issues_are,
        self.voting_issues_necessity,
        self.jargon_preference, self.rebuttal_comments,
        self.decision_paradigm,
        self.evidence_necessity, self.decision_comments,
        self.notetaking_preference, self.notetaking_comments
    ]
    if paradigm_fields.all? {|e| e.blank? }
      return true
    else
      return false
    end
  end

end
