class AddLevelsToJudges < ActiveRecord::Migration
  def change
    add_column :judges, :level, :string
  end
end
