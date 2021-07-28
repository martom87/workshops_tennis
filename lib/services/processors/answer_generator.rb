# frozen_string_literal: true

module Processors
  class AnswerGenerator
    def initialize(mode, counted_repeating_entries)
      @mode = mode
      @counted_repeating_entries = counted_repeating_entries
    end

    def call
      generate_result
    end

    private

    attr_reader :mode, :counted_repeating_entries

    def generate_result
      result = []
      counted_repeating_entries.each do |key, value|
        result << "#{key} #{value} #{mode} views"
      end
      result.join(' ')
    end
  end
end
