# frozen_string_literal: true

require_relative '../../lib/tennis/player.rb'

RSpec.describe Player do

  subject { described_class.new(points_amount, name)}
  let(:points_amount) {15}
  let(:name){'Edek'}

  it 'returns players points amount' do
    expect(subject.points_amount).to eq(points_amount)
  end

  it 'returns player\'s name' do
    expect(subject.name).to eq(name)
  end

end
