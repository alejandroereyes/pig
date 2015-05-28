class CreateLeaderboard < ActiveRecord::Migration
  def change
    create_table :leaderboards do |t|
      t.string  :name
      t.integer :score
      t.boolean :won
    end
  end
end
