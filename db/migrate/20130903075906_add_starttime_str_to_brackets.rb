class AddStarttimeStrToBrackets < ActiveRecord::Migration
  def change
    add_column :brackets, :start_time_string, :string
  end
end
