require_relative "station"

class Journey
  attr_reader :destination, :origin
  def initialize
    @origin = Station.new
    @destination = Station.new
    @complete = false
  end

  def calculate_fare
    return 1
  end

  def add_origin(station)
    @origin = station
  end

  def add_destination(station)
    @destination = station
  end

  def end_journey
    @complete = true
  end

  def complete?
    return @complete
  end
end