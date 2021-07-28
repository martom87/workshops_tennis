# frozen_string_literal: true

module Validators
  class CorrectPathValidator
    def initialize(path:)
      @path = path
    end

    def validate
      return false if path.nil? 
      
      file_is_present?(path)
    end

    private

    attr_reader :path

    def file_is_present?(path)
      File.exist?(path) 
    end
  end
end
