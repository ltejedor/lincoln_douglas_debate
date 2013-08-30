class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :order
    end
  end
end
