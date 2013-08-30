class AddAssociationsForDivisions < ActiveRecord::Migration
  def change
    add_column :rounds, :division_id, :integer
  end
end
