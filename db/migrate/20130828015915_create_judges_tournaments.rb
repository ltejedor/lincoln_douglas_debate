class CreateJudgesTournaments < ActiveRecord::Migration
  def change
    create_table :judges_tournaments do |t|
      t.belongs_to :judge
      t.belongs_to :tournament
    end    
  end
end
