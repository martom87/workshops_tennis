# frozen_string_literal: true

require_relative '../../../lib/services/readers_writers/path_service'

RSpec.describe ReadersWriters::PathService do
  subject { described_class.new(dialog_uri) }

  let(:dialog_uri) { 'file:/spec/fixtures/weblogs.log' }

  describe '#call' do
    context 'when the location of file to read is chosen' do
      let(:path) { '/spec/fixtures/weblogs.log' }

      it { expect(subject.call(:read_path)).to eq(path) }
    end

    context 'when the location for result file is chosen' do
      let(:path) { '/spec/fixtures' }

      it { expect(subject.call(:write_path)).to eq(path) }
    end
  end
end
