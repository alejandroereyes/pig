require_relative './player'
require_relative './open_game'
require_relative './leaderboard'

class Pig
  def initialize
    @players   = []
    @max_score = 10 #change back to 100 after debugging
  end

  def get_players
    puts "Getting player names. Type q when done."
    loop do
      print "Player #{@players.count + 1}, what is your name? > "
      input = gets.chomp
      if input == "q" || input == ""
        return
      else
        @players.push Player.new(input)
        # OpenGame.add_player_to_open_game(input, @players)
      end
    end
  end

  def play_round
    @players.each do |p|
      puts "\n\nIt is #{p.name}'s turn! You have #{p.score} points. (Press ENTER)"
      gets
      take_turn p
    end
    get_losers
    remove_losing_players!
  end

  def get_losers
    if @players.any? { |p| p.score > @max_score }
      losers = @players.sort_by { |p| p.score }.take(@players.count - 1)
      losers.each { |p| PlayerStat.store_loss_for_player(p) }
    end
  end

  def remove_losing_players!
    if @players.any? { |p| p.score > @max_score }
      # get players with scores > @max_score autoincrement
      max_score = @players.map { |p| p.score }.max
      @players = @players.select { |p| p.score == max_score }
    end
  end

  def winner
    if @players.length == 1
      @players.first
    end
  end

  def take_turn player
    turn_total = 0
    loop do
      roll = rand 1..6
      if roll == 1
        puts "You rolled a 1. No points for you!"
        return
      else
        turn_total += roll
        puts "You rolled a #{roll}. Turn total is #{turn_total}. Again?"
        if gets.chomp.downcase == "n"
          puts "Stopping with #{turn_total} for the turn."
          player.score += turn_total
          # OpenGame.store_current_game(player)
          player.score
          return
        end
      end
    end
  end
end
