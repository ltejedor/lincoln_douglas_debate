class AddFieldsToJudges < ActiveRecord::Migration
  def change
    add_column :judges, :experience, :string
    add_column :judges, :years_judging, :string
    add_column :judges, :season_judged_no, :string
    add_column :judges, :delivery_preference, :string
    add_column :judges, :delivery_weight, :string
    add_column :judges, :delivery_dealbreaker, :string
    add_column :judges, :criterion_weight, :string
    add_column :judges, :criterion_required, :string
    add_column :judges, :final_rebuttals_should_include, :string
    add_column :judges, :voting_issues_are, :string
    add_column :judges, :voting_issues_necessity, :string
    add_column :judges, :jargon_preference, :string
    add_column :judges, :decision_paradigm, :string
    add_column :judges, :evidence_necessity, :string
    add_column :judges, :notetaking_preference, :string
    add_column :judges, :experience_comments, :text
    add_column :judges, :delivery_comments, :text
    add_column :judges, :criterion_comments, :text
    add_column :judges, :rebuttal_comments, :text
    add_column :judges, :decision_comments, :text
    add_column :judges, :notetaking_comments, :text

  end
end
