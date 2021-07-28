# frozen_string_literal: true

require_relative '../../../lib/services/readers_writers/read_service'

RSpec.describe ReadersWriters::ReadService do
  subject { described_class.new(path).call }

  let(:nonexistent_log) { ['/flightradar24 737.800.737.300'] }
  let(:existent_log) { '/contact 184.123.665.067' }
  let(:path) { 'spec/fixtures/weblogs.log' }

    context 'when path is correct and does not contain extra logs ' do
      it { expect(subject).not_to include(nonexistent_log) }
    end

    context 'when path is correct and contains only logs from file' do
      it { expect(subject).to include(existent_log) }
    end

    context 'when path was not indicated' do
      let(:path) { nil }

      it { expect(subject).to eq([]) }
    end
end
