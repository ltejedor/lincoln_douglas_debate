class RevampCases < ActiveRecord::Migration
  def change
    change_column :cases, :title, :string
    change_column :cases, :description, :text

  end
end
