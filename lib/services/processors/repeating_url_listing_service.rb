# frozen_string_literal: true

require 'csv'

module Processors
  class RepeatingUrlListingService
    def initialize(mode, input_file_content)
      @input_file_content = input_file_content
      @mode = mode
    end

    def call
      list_repeating_urls
    end

    private

    attr_accessor :mode, :input_file_content

    def list_repeating_urls
      joined_pairs = create_url_ip_pairs.flatten
      joined_pairs.select { |entry| (joined_pairs.index(entry) % 2).zero? }
    end

    def create_url_ip_pairs
      pairs = separate_url_ips.each_slice(2).to_a
      mode == 'unique' ? pairs.uniq : pairs
    end

    def separate_url_ips
      input_file_content.flat_map { |entry| entry.split ' ' }
    end
  end
end
