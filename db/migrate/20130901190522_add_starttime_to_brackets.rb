class AddStarttimeToBrackets < ActiveRecord::Migration
  def change
    add_column :brackets, :starttime, :datetime
  end
end
