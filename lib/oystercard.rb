class Oystercard
  attr_reader :limit, :balance
  attr_writer :in_journey

  DEFAULT_LIMIT = 90
  FARE = 1

  def initialize (balance = 0, limit = DEFAULT_LIMIT)
    @balance = balance
    @limit = limit
    @in_journey = false
  end

  def top_up(amount = 0)
    raise "Top-up is over maximum balance #{self.limit}" if (self.balance + amount > self.limit)
    increment_balance(amount)
  end

  def deduct
    self.balance -= FARE
  end

  def touch_in
    raise "Funds too low" if self.balance < FARE
    self.in_journey = true
  end

  def touch_out
    self.in_journey = false
    deduct 
  end

  def in_journey?
    @in_journey
  end


  private
  attr_writer :balance

  def increment_balance(amount)
    self.balance += amount
  end

end
