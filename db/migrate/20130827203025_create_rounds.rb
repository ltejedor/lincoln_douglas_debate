class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :order
      t.references :tournament
    end
  end
end
