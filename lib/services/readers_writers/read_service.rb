# frozen_string_literal: true

module ReadersWriters
  class ReadService
    def initialize(path)
      @path = path
    end

    def call
      read_input
    end

    private

    attr_reader :path

    def read_input
      return [] if path.nil?
      
      File.readlines(path).map(&:chomp)
    end
  end
end
