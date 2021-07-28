# frozen_string_literal: true

require_relative '../../../lib/services/processors/repeating_url_listing_service'

RSpec.describe Processors::RepeatingUrlListingService do
  subject { described_class.new(mode, test_input).call }

  let(:mode) { 'all' }
  let(:test_input) do
    ['/about 682.704.613.213', '/index 836.973.694.403', '/index 836.973.694.403']
  end
  let(:expected_result) { ['/about', '/index', '/index'] }

  context 'when subject mode is set to all' do
    it { expect(subject).to eq(expected_result) }
  end

  context 'when subject mode is set to unique' do
    let(:mode) { 'unique' }

    it { expect(subject).to eq(expected_result.uniq) }
  end
end
