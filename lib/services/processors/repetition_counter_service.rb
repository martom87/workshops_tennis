# frozen_string_literal: true

module Processors
  class RepetitionCounterService
    def initialize(list_of_repeating_url)
      @list_of_repeating_url = list_of_repeating_url
    end

    def call
      sort_urls_repetitions_by_amount
    end

    private

    attr_reader :list_of_repeating_url

    def sort_urls_repetitions_by_amount
      calculate_urls_repetitions.sort_by { |_url, repetition_amount| -repetition_amount }
    end

    def calculate_urls_repetitions
      list_of_repeating_url.each_with_object(Hash.new(0)) do |url, hash|
        hash[url] += 1
      end
    end
  end
end
