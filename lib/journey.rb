# frozen_string_literal: true

# require 'Pry'

class Journey
  attr_reader :in_journey, :entry_station, :exit_station, :all_journeys, :one_journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @in_journey = false
    @entry_station = nil
    @exit_station = nil
    @all_journeys = []
    @one_journey = { @entry_station => @exit_station }
  end

  def touch_in(station)
    raise('You have already tapped in!') if @in_journey == true

    @in_journey = true
    @one_journey = { station => @exit_station }
    @entry_station = station
  end

  def touch_out(station)
    raise('You have already tapped out!') if @in_journey == false

    @exit_station = station
    @one_journey[@entry_station] = station
    @all_journeys.push(@one_journey)
    @in_journey = false
    # @entry_station = nil
  end

  def fare
    if entry_station == nil || exit_station == nil
      return PENALTY_FARE
    else
      return MINIMUM_FARE
    end
  end
end

# binding.pry
