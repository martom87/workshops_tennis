# frozen_string_literal: true

require_relative '../../../lib/services/processors/answer_generator'

RSpec.describe Processors::AnswerGenerator do
  subject { described_class.new(mode, counted_entries).call }

  let(:mode) { 'all' }
  let(:counted_entries) { [['/about/2', 90]] }
  let(:expected_phrase) { 'all views' }

  context 'when mode is set to all' do
    it { expect(subject.include?('all views')).to be true }
  end

  context 'when mode is set to unique' do
    let(:mode) { 'unique' }

    it { expect(subject.include?('unique views')).to be true }
  end
end
