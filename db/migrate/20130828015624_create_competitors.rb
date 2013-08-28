class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      t.belongs_to :debater
      t.belongs_to :tournament
    end
  end
end
