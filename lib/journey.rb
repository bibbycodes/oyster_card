class Journey
  attr_reader :destination, :origin
  def initialize
    @origin = Station.new
    @destination = Station.new
    @complete = false
  end

  def add_origin(station)
    @origin = station
  end

  def add_destination(station)
    @destination = station
  end

  def complete?
    return @complete
  end
end