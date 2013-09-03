class AddSocialAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter, :string
    add_column :users, :facebook, :string
    add_column :users, :social_email, :string #if user wants to direct others to another email besides google+ one
    add_column :users, :website, :string
  end
end
