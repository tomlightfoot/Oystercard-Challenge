class Station
  def entry_station(station, zone)
    @entry_station = {station => zone}
  end

  def exit_station(station, zone)
    @exit_station = {station => zone}
  end

  # def journey
  #   @journey = { :entry_station => @entry_station, :exit_station => @exit_station }
  # end
end
