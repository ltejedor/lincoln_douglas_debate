class AddFieldsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :member_since, :datetime
    add_column :users, :last_logged_in, :datetime
    add_column :users, :profile_views, :integer
    add_column :users, :location, :string
    add_column :users, :rep, :integer
    add_column :users, :rank, :integer
    add_column :users, :is_judge, :boolean
    add_column :users, :is_debater, :boolean
    add_column :users, :is_coach, :boolean
    add_column :users, :is_instructor, :boolean
    add_column :users, :is_organizer, :boolean
    add_column :users, :is_contributor, :boolean
    remove_column :users, :points
  end
  def down
    remove_column :users, :member_since, :string
    remove_column :users, :last_logged_in, :string
    remove_column :users, :profile_views, :integer
    remove_column :users, :location, :string
    remove_column :users, :rep, :integer
    remove_column :users, :rank, :integer
    remove_column :users, :is_judge, :boolean
    remove_column :users, :is_debater, :boolean
    remove_column :users, :is_coach, :boolean
    remove_column :users, :is_instructor, :boolean
    remove_column :users, :is_organizer, :boolean
    remove_column :users, :is_contributor, :bool
    add_column :users, :points, :integer
  end
  
end
