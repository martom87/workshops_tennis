# frozen_string_literal: true

require_relative '../services/readers_writers/read_service'
require_relative '../services/processors/repetition_counter_service'
require_relative '../services/processors/repeating_url_listing_service'
require_relative '../services/processors/answer_generator'
require_relative '../services/processors/summary_generator'
require_relative '../services/readers_writers/output_generator_service'
require_relative '../validators/correct_path_validator'
require_relative '../validators/empty_file_validator'

class VisitsController
  attr_accessor :mode

  def initialize(mode, path, path_to_dir)
    validate_input_file(path)
    @mode = mode
    @path = path
    @path_to_dir = path_to_dir
  end

  def generate_result_without_file
    Processors::AnswerGenerator.new(mode, count_repeating_entries).call
  end

  def generate_summary
    Processors::SummaryGenerator.new(mode, path_to_dir, path).call
  end

  def generate_output_file
    ReadersWriters::OutputGeneratorService.new(generate_result_without_file, path_to_dir).call
  end

  private

  attr_reader :path, :path_to_dir

  def count_repeating_entries
    Processors::RepetitionCounterService.new(list_repeating_entries).call
  end

  def list_repeating_entries
    Processors::RepeatingUrlListingService.new(mode, read_file).call
  end

  def validate_input_file(path)
    path_validator = Validators::CorrectPathValidator.new(path: path)
    path_validator.validate ? true : (puts 'no file chosen, try again'; abort)
    file_validator = Validators::EmptyFileValidator.new(path: path)
    file_validator.validate ? true : (puts 'file is empty, try again'; abort)
  end

  def read_file
    ReadersWriters::ReadService.new(path).call
  end
end
