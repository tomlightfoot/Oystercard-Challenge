class Journey
  attr_reader :journey, :entry_station, :exit_station

  def initialize(journey = {}, entry_station = "Clapham")
    @journey = journey
    @entry_station = entry_station
    @exit_station = nil
  end

end
