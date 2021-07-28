require_relative 'player'
require 'pry'
class Game
  def initialize(players = [])
    @players = players
  end

  def call
   find_winner

   # find_winner_after_deuce
  end

  private

  attr_accessor :players

  def find_winner
    unless (players.first.points_amount == players.last.points_amount) || (players.first.points_amount < 40 && players.second.points_amount < 40)
      winner = players.max_by { |player| player.points_amount }
      "The winner is #{winner.name}" if winner.points_amount == 40
    else
      announce_deuce
    end
  end

  def announce_deuce
    if players.first.points_amount == 40
      'Deduce'
    end
  end

  def find_winner_after_deuce
    player1 = players.first.points_amount
    player2 = players.last.points_amount

    if (player1 > 40) && (player2>40)
    if player1 - player2 == 2
      "The winner is #{players.first.name}"
    else
      "The winner is #{players.last.name}"
    end
    end

  end
end
