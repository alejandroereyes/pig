class OpenGame < ActiveRecord::Base

  def self.add_player_to_open_game(name, players_array)
    OpenGame.create(name: name, score: 0)
    hold_this = OpenGame.select('id').last
    players_array[players_array.count - 1].add_id(hold_this.id)
  end

  def self.store_current_game(player)
    OpenGame.where(id: player.id).update_all(score: player.score)
  end
end
