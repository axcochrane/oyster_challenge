class Oystercard
  attr_reader :limit, :balance
  DEFAULT_LIMIT = 90
  FARE = 2

  def initialize (balance = 0, limit = DEFAULT_LIMIT)
    @balance = balance
    @limit = limit
  end

  def top_up(amount = 0)
    raise "Top-up is over maximum balance #{self.limit}" if (self.balance + amount > self.limit)
    increment_balance(amount)
  end

  def deduct
    self.balance -= FARE
  end

  def journey?
  end 

  private
  attr_writer :balance

  def increment_balance(amount)
    self.balance += amount
  end

end
