class AddAssociationsForDivisions < ActiveRecord::Migration
  def change
    add_column :rounds, :division_id, :integer
    add_column :competitors, :division_id, :integer
    add_column :judge_registrations, :division_id, :integer
  end
end
