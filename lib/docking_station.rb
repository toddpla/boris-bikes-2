require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' unless @bikes.length > 0
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' unless @bikes.length < 20
    @bikes << bike
  end

end
