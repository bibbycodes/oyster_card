class OysterCard
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :MIN_FARE, :entry_station, :last_journey, :journey_history

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
    @last_journey = Hash.new
    @journey_history = []
  end

  def top_up(amount)
    fail "The maximum balance for an oyster card is £#{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient funds!" unless sufficient_funds?
    @entry_station = entry_station
  end

  def touch_out(destination)
    deduct
    @last_journey = {
      :origin => @entry_station,
      :destination => destination
    }
    save_journey(@last_journey)
    @entry_station = nil
  end

  def in_journey?
    return @entry_station != nil
  end

  def sufficient_funds?
    return @balance > MIN_FARE
  end

  private

  def deduct
    @balance -= 1
  end

  def save_journey(journey)
    @journey_history << journey
  end
  
end

