class AddLevelsToJudges < ActiveRecord::Migration
  def change
    add_column :judges, :levels, :string
  end
end
