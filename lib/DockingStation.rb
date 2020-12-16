require_relative 'Bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    @bike = bike
    fail 'Docking station full' if full?
    @bikes << @bike
  end 


  def release_bike
    # fail 'No bikes available' if empty?
    # @bikes.pop

    if empty?
      fail 'No bikes available'
    elsif broken?
      fail 'No bikes available'
    else 
      @bikes.pop
    end
  end

  attr_reader :bike

  private

  attr_reader :bikes 
  
  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

  def broken?
    @bikes.each { |e| e.broken? }
  end

end
