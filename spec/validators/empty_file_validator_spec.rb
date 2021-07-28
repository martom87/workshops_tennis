# frozen_string_literal: true

require_relative '../../lib/validators/empty_file_validator'

RSpec.describe Validators::EmptyFileValidator do
  subject { described_class.new(path: path).validate }

  let(:path) { 'spec/fixtures/empty_logs.log' }

  it 'validates if the file has any content' do
    expect(subject).to be false
  end
end
