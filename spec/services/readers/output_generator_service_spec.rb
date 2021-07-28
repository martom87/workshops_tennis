# frozen_string_literal: true

require_relative '../../../lib/services/readers_writers/output_generator_service'

RSpec.describe ReadersWriters::OutputGeneratorService do
  subject(:output_generator_service) { described_class.new(result, path_to_dir).call }

  let(:result) { 'foo' }
  let(:path_to_dir) { 'spec/fixtures' }

  it 'generates output csv format file' do
    expect(subject.class).to be(CSV)
  end
end
