require 'pry'

class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINUMUM_BALANCE = 1
  MINUMUM_CHARGE = 1

  attr_reader :balance, :in_journey

  def initialize
    @balance = DEFAULT_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    raise("Maximum limit of #{MAXIMUM_BALANCE} exceded") if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
    puts "Topped up £#{amount}. New balance: £#{@balance}"
    return @balance
  end

  def touch_in
    @balance < MINUMUM_BALANCE ? raise("Insufficient funds") : @in_journey = true 
  end

  def touch_out
    deduct
    @in_journey = false
  end

  private

  def deduct
    @balance -= MINUMUM_CHARGE
  end

  # def in_journey?
  #   @in_journey = true
  # end

  # def limit_exceded?
  #   @balance > 90
  # end

end

# binding.pry
