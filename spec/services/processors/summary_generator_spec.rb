require_relative '../../../lib/services/processors/summary_generator'

RSpec.describe Processors::SummaryGenerator do
  subject { described_class.new(mode, path_to_result_file, path).call }

  let(:mode) { 'all' }
  let(:path_to_result_file) { 'foo' }
  let(:path) { 'bar' }

  it 'returns a successful response', aggregate_failures: true do
    expect(subject).to include(mode)
    expect(subject).to include(path_to_result_file)
    expect(subject).to include(path)
  end
end
