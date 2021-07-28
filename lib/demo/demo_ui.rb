# frozen_string_literal: true

require '../controllers/visits_controller'
require '../view/user_interface'

ui = UserInterface.new
controller = VisitsController.new(ui.mode, ui.path, ui.path_to_dir)
controller.generate_output_file

p controller.generate_result_without_file
puts controller.generate_summary
