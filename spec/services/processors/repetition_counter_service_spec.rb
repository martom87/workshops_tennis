# frozen_string_literal: true

require_relative '../../../lib/services/processors/repetition_counter_service'

RSpec.describe Processors::RepetitionCounterService do
  subject { described_class.new(test_input).call }

  let(:test_input) { ['/about', '/index', '/index'] }
  let(:sorted_test_result) { [['/index', 2], ['/about', 1]] }

  it 'sorts urls according to visits amount' do
    expect(subject).to eq(sorted_test_result)
  end
end
