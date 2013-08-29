class CreateBrackets < ActiveRecord::Migration
  def change
    create_table :brackets do |t|
      t.datetime :starttime
      t.string :name
      t.references :round
    end
  end
end
