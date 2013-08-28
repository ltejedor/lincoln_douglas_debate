class AddRsvptournamentIdToDebaters < ActiveRecord::Migration
  def change
    add_column :debaters, :rsvptournament_id, :integer
  end
end
