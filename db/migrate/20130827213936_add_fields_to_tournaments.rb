class AddFieldsToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :start, :datetime
    add_column :tournaments, :end, :datetime
  end
end
