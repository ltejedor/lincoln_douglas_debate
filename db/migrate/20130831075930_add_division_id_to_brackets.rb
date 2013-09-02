class AddDivisionIdToBrackets < ActiveRecord::Migration
  def change
    add_column :brackets, :division_id, :integer
  end
end
