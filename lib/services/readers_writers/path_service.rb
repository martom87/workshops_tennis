# frozen_string_literal: true

require 'uri'

module ReadersWriters
  class PathService
    def initialize(dialog_uri)
      @dialog_uri = dialog_uri
    end

    def call(param)
      set_paths(param)
    end

    private

    attr_reader :dialog_uri

    def set_paths(param)
      param == :read_path ? set_file_read_path : set_file_write_path
    end

    def set_file_read_path
      URI(dialog_uri).path.split('://').last.gsub('%20', ' ')
    end

    def set_file_write_path
      File.dirname(set_file_read_path)
    end
  end
end