class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :uid
    add_index :users, :provider
  end
end
