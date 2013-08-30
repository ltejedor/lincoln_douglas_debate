class RenameTypeToKindInRounds < ActiveRecord::Migration
  def change
    rename_column :rounds, :type, :kind
  end
end
