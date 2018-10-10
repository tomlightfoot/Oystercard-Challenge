class Station

  attr_reader :name, :zone

  def initialize(name="Camden", zone=5)
    @name = name
    @zone = zone
  end

end
