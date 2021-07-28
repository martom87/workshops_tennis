# frozen_string_literal: true

require_relative '../../lib/tennis/game.rb'

RSpec.describe Game do

  subject { described_class.new(players).call }
  let(:player1) { Player.new(39, 'Karolina') }
  let(:player2) { Player.new(15, 'Marcin') }
  let(:players) { [player1, player2] }

  describe '#call' do
    context 'When player1 who has more points wins' do
      let(:winner) { "The winner is #{player1.name}" }

      it 'indicates player one as the winner ' do
        expect(subject).to eq(winner)
      end
    end

    context 'When both players have 40 points' do
      let(:player1) { Player.new(40, 'Karolina') }
      let(:player2) { Player.new(40, 'Marcin') }
      it 'indicates deduce' do
        expect(subject).to eq('Deduce')
      end
    end
    #
    context 'When player1 wins in the deuce' do
      let(:player1) { Player.new(42, 'Karolina') }
      let(:player2) { Player.new(40, 'Marcin') }
      it 'indicates player1 as the winner' do
        expect(subject).to eq("The winner is #{player1.name}")
      end
    end

    context 'When there was deuce but there is still no winner' do
      let(:player1) { Player.new(41, 'Karolina') }
      let(:player2) { Player.new(40, 'Marcin') }
      it 'indicates player1 as the winner' do
        expect(subject).to eq(nil)
      end
    end



  end
end
