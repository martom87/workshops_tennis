# frozen_string_literal: true

module ReadersWriters
  class OutputGeneratorService
    def initialize(result, path_to_dir)
      @result = result
      @path_to_dir = path_to_dir
    end

    def call
      generate_output_file
    end

    private

    attr_accessor :result, :path_to_dir

    def generate_output_file
      file = 'view_results.csv'
      path_to_save = "#{path_to_dir}/#{file}"
      CSV.open(path_to_save, 'w') do |writer|
        writer << [result]
      end
    end
  end
end
