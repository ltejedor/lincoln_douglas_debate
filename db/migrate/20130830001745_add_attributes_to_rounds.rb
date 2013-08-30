class AddAttributesToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :type, :string
    add_column :rounds, :subtype, :string
  end
end
