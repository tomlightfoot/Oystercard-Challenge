class Card

  attr_reader :balance
  attr_accessor :journey

  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @journey = false
  end

  def top_up(money)
    fail "Top up would take balance over card limit - £#{LIMIT}" if exceeds_limit?(money)
    @balance += money
  end

  def touch_in
    fail "You need a minimum balance of £#{MINIMUM_FARE} to enter barrier." if balance_low
    self.journey=(true)
  end

  def touch_out
    deduct(MINIMUM_FARE)
    self.journey=(false)
  end

  def in_journey?
    journey
  end

  private

  def exceeds_limit?(money)
    (@balance + money) > LIMIT
  end

  def balance_low
    balance <= MINIMUM_FARE
  end

  def deduct(fare)
    @balance -= fare
  end

end
