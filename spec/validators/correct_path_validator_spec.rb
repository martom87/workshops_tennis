# frozen_string_literal: true

require_relative '../../lib/validators/correct_path_validator'

RSpec.describe Validators::CorrectPathValidator do
  subject { described_class.new(path: path).validate }

  context 'when path leads to a proper file' do
    let(:path) { 'spec/fixtures/weblogs.log' }

    it { expect(subject).to be true }
  end

  context 'when no path was chosen' do
    let(:path) { nil }

    it { expect(subject).to be false }
  end

  context 'when path is wrong' do
    let(:path) { 'whatever' }

    it { expect(subject).to be false }
  end
end
