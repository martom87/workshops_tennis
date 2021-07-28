require_relative 'player'
class Game
  def initialize(players=[])
    @players = players
  end

  def call
    find_winner
  end

  private

  attr_reader :players


  def find_winner
    unless (players.first.points_amount == players.last.points_amount)
      winner = players.max_by{|player| player.points_amount}
      "The winner is #{winner.name}" if winner.points_amount >= 40
    else
      announce_deuce
    end
  end

  def announce_deuce
    'Deduce' if players.first.points_amount == 40
  end
end
