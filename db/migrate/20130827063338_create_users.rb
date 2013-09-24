class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :email
      t.string :image
      t.string :googleplus
      t.string :verified_email
      t.string :birthday
      t.string :time_zone
      t.text :summary
      t.integer :points
      t.integer :rep_points
      t.integer :rank_points

      t.timestamps
    end
  end
end
