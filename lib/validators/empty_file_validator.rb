# frozen_string_literal: true

module Validators
  class EmptyFileValidator
    def initialize(path:)
      @path = path
    end

    attr_reader :path

    def validate
      !File.zero?(path)
    end
  end
end
