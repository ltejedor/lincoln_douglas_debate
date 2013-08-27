class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :round
      t.datetime :start
      t.datetime :end
    end
  end
end
