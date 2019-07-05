# frozen_string_literal: true

require 'pry'

class Station
  attr_reader :name, :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end

class Oystercard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINUMUM_BALANCE = 1
  MINUMUM_CHARGE = 1

  attr_reader :balance, :in_journey, :entry_station, :exit_station, :all_journeys, :one_journey

  def initialize(journey = Journey.new)
    @balance = DEFAULT_BALANCE
    @in_journey = false
    @entry_station = nil
    @exit_station = nil
    @one_journey = { @entry_station => @exit_station }
    @journey = journey
    @all_journeys = @journey.all_journeys
  end

  def top_up(amount)
    raise("Maximum limit of #{MAXIMUM_BALANCE} exceded") if @balance + amount > MAXIMUM_BALANCE

    @balance += amount
    puts "Topped up £#{amount}. New balance: £#{@balance}"
    @balance
  end

  def touch_in(station)
    @journey.touch_in(station)
    @balance < MINUMUM_BALANCE ? raise('Insufficient funds') : @in_journey = true
  end

  def touch_out(station)
    @journey.touch_out(station)
    deduct
    @in_journey = false
    # @entry_station = nil
  end

  private

  def deduct
    @balance -= MINUMUM_CHARGE
  end

  # def in_journey?
  #   entry_station
  # end

  # def limit_exceded?
  #   @balance > 90
  # end
end

binding.pry
