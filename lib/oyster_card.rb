class OysterCard
  @@MAX_BALANCE = 90
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    fail "The maximum balance for an oyster card is £#{@@MAX_BALANCE}" if (@balance + amount) > @@MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    return @in_journey
  end
end