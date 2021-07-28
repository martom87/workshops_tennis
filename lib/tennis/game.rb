require_relative 'player'
class Game
  def initialize(players=[])
    @players = players
  end

  def call
    "The winner is #{find_winner.name}"
  end

  private

  attr_reader :players


  def find_winner
    players.max_by{|player| player.points_amount}
  end
end
