class OysterCard
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :MIN_FARE

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    fail "The maximum balance for an oyster card is £#{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in
    fail "Insufficient funds!" unless sufficient_funds?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct
  end

  def in_journey?
    return @in_journey
  end

  def sufficient_funds?
    return @balance > MIN_FARE
  end

  private

  def deduct
    @balance -= 1
  end
  
end

