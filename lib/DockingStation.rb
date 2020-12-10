require_relative 'Bike'

class DockingStation
  def initialize
    @bikes = []
  end

  def dock(bike)
    @bike = bike
    fail 'Docking station full' if full?
    @bikes << @bike
  end 


  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  attr_reader :bike

  private
  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end
end
