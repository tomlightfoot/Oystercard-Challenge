class Card
  attr_reader :balance, :entry_station, :exit_station, :journey, :journey_history

  LIMIT = 90
  MINIMUM_FARE = 1
  DEFAULT_CHARGE = 6

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
    @journey = {}
    @journey_history = []
  end

  def top_up(money)
    fail "Top up would take balance over card limit - £#{LIMIT}" if exceeds_limit?(money)
    @balance += money
  end

  def touch_in(entry_station)
    deduct(DEFAULT_CHARGE) and return "You didn't touch out on your last journey, you will be charged a penalty fee of £#{Card::DEFAULT_CHARGE}" if in_journey?
    fail "You need a minimum balance of £#{MINIMUM_FARE} to enter barrier." if balance_low
    @entry_station = entry_station
    journey[:entry_station] = @entry_station
  end

  def touch_out(exit_station)
    deduct(DEFAULT_CHARGE) and return "You didn't touch in, you will be charged a penalty fee of £#{Card::DEFAULT_CHARGE}" if !in_journey?
    deduct(MINIMUM_FARE)
    @entry_station = nil
    journey[:exit_station] = exit_station
    journey_to_history
    reset_journey
  end

  def in_journey?
    entry_station != nil
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

  def journey_to_history
    journey_history << journey
  end

  def reset_journey
    @journey = {}
  end
end
