class AddAttributeToTournamentsForSeedData < ActiveRecord::Migration
  def change
    add_column :tournaments, :asset_url, :string
  end
end
