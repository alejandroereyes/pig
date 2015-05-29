class PlayerStat < ActiveRecord::Base

  def self.store_win_for_player(winner)
    if PlayerStat.exists?(name: winner.name)
      current = PlayerStat.where(name: winner.name).sum(:wins)
      PlayerStat.where(name: winner.name).update_all(wins: current + 1)
    else
      PlayerStat.create(name: winner.name, wins: 1)
    end
  end

  def self.store_loss_for_player(player)
    if PlayerStat.exists?(name: player.name)
      current = PlayerStat.where(name: player.name).sum(:losses)
      PlayerStat.where(name: player.name).update_all(losses: current + 1)
    else
      PlayerStat.create(name: player.name, losses: 1)
    end
  end

  def self.display_stats
    stats = PlayerStat.select('*').group(:name)
    puts ""
    puts "Name     Wins     Losses"
    puts "------------------------"
    stats.each{ |player| puts "#{player.name}   -  #{player.wins}  -  #{player.losses}"}
  end
end
