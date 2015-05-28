class Leaderboard < ActiveRecord::Base

  def top_players
    Leaderboard.group(:name).sum(:score).order(score: :desc).limit(5)
  end
end
