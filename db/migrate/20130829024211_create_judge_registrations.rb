class CreateJudgeRegistrations < ActiveRecord::Migration
  def change
    create_table :judge_registrations do |t|
      t.references :judge
      t.references :tournament
      t.references :division

      t.timestamps
    end
  end
end
