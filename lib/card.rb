class Card

  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def add(money)
    fail "Can't add more than £100" if money > 100
    @amount += money
  end

  def deduct(fare)
    @amount -= fare
  end

end
