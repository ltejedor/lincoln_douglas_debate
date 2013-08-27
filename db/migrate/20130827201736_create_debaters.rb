class CreateDebaters < ActiveRecord::Migration
  def change
    create_table :debaters do |t|
      t.string :side
      t.string :level
      t.references :user
      t.references :tournament

      t.timestamps
    end
  end
end
