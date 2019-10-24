require_relative "journey"

class OysterCard
  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :MINIMUM_FARE, :entry_station, :current_journey, :journey_history

  def initialize(balance = 0)
    @balance = balance
    @current_journey = nil
    @journey_history = []
  end

  def top_up(amount)
    fail "The maximum balance for an oyster card is £#{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient funds!" unless sufficient_funds?
    
    @current_journey = Journey.new
    @current_journey.add_origin(entry_station)
  end

  def touch_out(exit_station)
    deduct(1)
    @current_journey.add_destination(exit_station)
    save_journey(@current_journey)
  end

  def in_journey?
    @current_journey.complete? ? false : true
  end

  def sufficient_funds?
    return @balance > MINIMUM_FARE
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def save_journey(journey)
    @journey_history << journey
  end
  
end

