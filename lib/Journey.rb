class Journey
  attr_reader :journey, :journey_history

  def initialize
    @journey = {}
    @journey_history = []
    @station = Station.new
  end

  # def journey
  #    @journey = { :entry_station => @station.entry_station(station, zone), :exit_station => @station.entry_station(station, zone) }
  # end
end
