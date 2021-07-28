# frozen_string_literal: true

require '../controllers/visits_controller'

path = '../../spec/fixtures/weblogs.log'
controller = VisitsController.new(nil, path, nil)

case ARGV[0]
when '-all'
  controller.mode = 'all'
when '-uniq'
  controller.mode = 'unique'
end

p controller.generate_result_without_file
