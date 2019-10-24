require_relative "station"

class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :destination, :origin, :PENALTY_FARE, :fare
  
  def initialize
    @origin = ""
    @destination = ""
    @complete = false
    @fare = PENALTY_FARE
  end

  def calculate_fare
    @fare = self.complete? ? MINIMUM_FARE : PENALTY_FARE
  end

  def add_origin(station)
    @origin = station
  end

  def add_destination(station)
    @destination = station
  end

  def end_journey
    return self
  end

  def complete?
    @complete = (@origin != "" && @destination != "") ? true : false
  end
end