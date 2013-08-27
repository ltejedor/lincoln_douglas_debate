class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|
      t.string :name
      t.string :description
      t.boolean :current

      t.timestamps
    end
  end
end
