class Leaderboard < ActiveRecord::Base

  def self.top_players
    Leaderboard.group(:name).sum(:score).order(score: :desc).limit(5)
  end

  def self.store_winner(winner)
    Leaderboard.create(name: winner.name, score: winner.score, won: true)
  end
end
