class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.text :description
      t.string :asset
      t.string :asset_url
      t.string :asset_file_name
      t.timestamps
    end
  end
end
