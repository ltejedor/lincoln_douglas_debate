class CreateRoundBrackets < ActiveRecord::Migration
  def change
    create_table :round_brackets do |t|
      t.datetime :starttime
      t.references :round
      t.references :bracket
    end
  end
end
