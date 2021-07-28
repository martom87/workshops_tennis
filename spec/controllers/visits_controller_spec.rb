# frozen_string_literal: true

require_relative '../../lib/controllers/visits_controller'

RSpec.describe VisitsController do
  subject { described_class.new(mode, input_file_path, path_to_dir) }

  let(:mode) { 'all' }
  let(:input_file_path) { 'spec/fixtures/weblogs.log' }
  let(:path_to_dir) { 'spec/fixtures' }

  describe '#generate_result_without_file' do
    it { expect(subject.generate_result_without_file.class).to be(String) }
  end

  describe '#generate_summary' do
    it 'returns a successful response', aggregate_failures: true do
      expect(subject.generate_summary).to include('outread from:')
      expect(subject.generate_summary).to include('in mode:')
      expect(subject.generate_summary).to include('result saved to:')
    end
  end

  describe '#generate_output_file' do
    it { expect(subject.generate_output_file.class).to be(CSV) }
  end
end
