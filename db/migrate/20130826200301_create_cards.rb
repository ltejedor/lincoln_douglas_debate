class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.references :topic

      t.timestamps
    end
    add_index :cards, :topic_id
  end
end
