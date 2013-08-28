class AddAttributesToCompetitors < ActiveRecord::Migration
  def change
    add_column :competitors, :division, :string
  end
end
