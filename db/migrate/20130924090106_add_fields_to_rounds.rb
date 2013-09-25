class AddFieldsToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :kind, :string
  end
end
