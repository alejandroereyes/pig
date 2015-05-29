class PlayerStat < ActiveRecord::Base

  def self.store_win_for_player(winner)
    if PlayerStat.exists?(name: winner.name)
      current = PlayerStat.where(name: winner.name).sum(:wins)
      PlayerStat.where(name: winner.name).update_all(wins: current + 1)
    else
      PlayerStat.create(name: winner.name, wins: 1)
    end
  end
end
