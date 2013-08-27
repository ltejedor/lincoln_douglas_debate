class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.references :user
    end
  end
end
