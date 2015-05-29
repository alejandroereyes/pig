class CreatePlayerStat < ActiveRecord::Migration
  def change
    create_table :player_stats do |t|
      t.string  :name
      t.integer :wins
      t.integer :losses
    end
  end
end
