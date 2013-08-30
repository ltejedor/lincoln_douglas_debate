class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :summary, :text
    add_column :users, :points, :integer
  end
end
