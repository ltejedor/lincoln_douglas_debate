class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :bracket
    end
  end
end
