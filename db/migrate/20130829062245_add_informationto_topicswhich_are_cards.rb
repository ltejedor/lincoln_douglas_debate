class AddInformationtoTopicswhichAreCards < ActiveRecord::Migration
  def change
  	add_column :topics, :source, :string
  	add_column :topics, :body, :string
  	add_column :topics, :starred, :boolean
  	rename_column :topics, :description, :string
  end
end
