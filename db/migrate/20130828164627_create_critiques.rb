class CreateCritiques < ActiveRecord::Migration
  def change
    create_table :critiques do |t|
      t.string :name
      t.text :body
      t.references :case

      t.timestamps
    end
    add_index :critiques, :case_id
  end
end
