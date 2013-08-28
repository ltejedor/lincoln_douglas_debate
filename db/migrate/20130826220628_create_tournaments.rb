class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.text :summary
      t.text :description
      
      t.text :summary
      t.text :entry_info
      t.text :divisions_info
      t.text :rules_info
      t.text :judges_info
      t.text :additional_info

      t.string :image
      t.datetime :starttime
      t.datetime :endtime

      t.references :organizer

      t.timestamps
    end
  end
end
