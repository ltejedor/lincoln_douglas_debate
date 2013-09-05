class ChangeTopics < ActiveRecord::Migration
  def change
    change_column :topics, :name, :string
    change_column :topics, :body, :text
    change_column :topics, :source, :text
  end
end
