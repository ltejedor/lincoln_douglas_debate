class RemodelAssociationsDueToRoundBrackets < ActiveRecord::Migration
  def change
    remove_column :rounds, :tournament_id, :integer
    remove_column :brackets, :starttime, :datetime
    remove_column :matches, :bracket_id, :integer
  end
end
