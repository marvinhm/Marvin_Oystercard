# require 'Pry'

class Journey

   attr_reader :in_journey, :entry_station, :exit_station, :all_journeys, :one_journey


    def intialize 
        p "helloooooo"
        @in_journey = false
        @entry_station = nil
        @exit_station = nil
        @all_journeys = []
        @one_journey = {@entry_station => @exit_station}
    end 

    def touch_in(station)
        @entry_station = station
        @one_journey = {station => @exit_station}
        @entry_station = true 
    end
    
      def touch_out(station)
        @exit_station = station
        p "Hellllooooooooooooo"
        @one_journey[@entry_station] = station
        p "Hellllooooooooooooo"
        @all_journeys
        @all_journeys.push(@one_journey)
        @in_journey = false
        # @entry_station = nil
      end
end

# binding.pry