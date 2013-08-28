class CreateDebatersTournaments < ActiveRecord::Migration
  def change
    create_table :debaters_tournaments do |t|
      t.belongs_to :debater
      t.belongs_to :tournament
    end
  end
end
