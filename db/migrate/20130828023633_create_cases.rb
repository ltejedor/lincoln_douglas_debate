class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :title
      t.string :description
      t.text :content
      t.string :type
      t.boolean :anon
      t.references :resolution

      t.timestamps
    end
    add_index :cases, :resolution_id
  end
end
