class CreateSavedGame < ActiveRecord::Migration
  def change
    create_table :saved_games do |t|
      t.string :name
      t.string :score
    end
  end
end
