class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.text :paradigm
      t.references :user

      t.timestamps
    end
  end
end
