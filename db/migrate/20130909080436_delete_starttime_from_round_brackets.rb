class DeleteStarttimeFromRoundBrackets < ActiveRecord::Migration
  def change
    remove_column :round_brackets, :starttime
  end
end
