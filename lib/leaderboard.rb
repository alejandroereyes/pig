class Leaderboard < ActiveRecord::Base

  def self.top_players
    all_winners = Leaderboard.group(:name).sum(:score)
    puts ""
    puts "TOP PLAYERS"
    puts "***********"
    puts "Name  Score"
    puts "-----------"
    all_winners.sort_by{ |k, v| v}.reverse.take(5).each { |pair| puts pair.join(" - ")}
  end

  def self.store_winner(winner)
    Leaderboard.create(name: winner.name, score: winner.score, won: true)
  end
end

