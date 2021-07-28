# frozen_string_literal: true

require_relative '../../lib/tennis/game.rb'

RSpec.describe Game do

  subject { described_class.new(players).call }
  let(:player1) { Player.new(40, 'Karolina') }
  let(:player2) { Player.new(15, 'Marcin') }
  let(:players) { [player1, player2] }

  describe '#call' do
    context 'When player1 one has more points wins' do
      let(:winner) { "The winner is #{player1.name}" }

      it 'indicates player one as the winner ' do
        expect(subject).to eq(winner)
      end
    end

  end
end
