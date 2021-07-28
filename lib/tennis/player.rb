class Player

  def initialize(points_amount, name)
    @points_amount = points_amount
    @name = name
  end

  attr_accessor :points_amount, :name
end
