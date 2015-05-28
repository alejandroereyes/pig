class OpenGame < ActiveRecord::Migration
  def change
    create_table :open_games do |t|
      t.string  :name
      t.integer :score
    end
  end
end
