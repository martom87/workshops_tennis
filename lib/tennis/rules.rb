require_relative 'player'
require 'pry'

class Rules
  def initialize(players = [])
    @players = players
  end

  def call
    find_winner
  end

  private

  attr_accessor :players

  def find_winner
    winner = players.max_by { |player| player.points_amount }
    return "The winner is #{winner.name}" if ((players.first.points_amount < 40) && (players.last.points_amount < 40))
    announce_deuce
  end

  def announce_deuce
    player1 = players.first.points_amount
    player2 = players.last.points_amount
    return 'Deduce' if player1 == 40 && player2 == 40
    find_winner_after_deuce(player1, player2)
  end

  def find_winner_after_deuce(player1, player2)
    if player1 - player2 == 2
      winner = "The winner is #{players.first.name}"
    end
    if player2 - player1 == 2
      winner = "The winner is #{players.last.name}"
    end
    winner
  end
end
