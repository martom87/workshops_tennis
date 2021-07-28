module Processors
  class SummaryGenerator
    def initialize(mode, path_to_result_file, path)
      @mode = mode
      @path_to_result_file = path_to_result_file
      @path = path
    end

    def call
      generate_summary
    end

    private

    attr_accessor :mode, :path_to_result_file, :result, :path

    def generate_summary
      summary = "----------------------"
      summary << "\n"
      summary << " outread from: #{path}"
      summary << "\n"
      summary << " in mode: #{mode}"
      summary << "\n"
      summary << " result saved to: #{path_to_result_file}"
      summary
    end
  end
end
