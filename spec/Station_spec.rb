require './lib/Station'

describe Station do
  it 'has a name' do
    station = Station.new("Barbican", 1)
    expect(station.name).to eq "Barbican"
  end
  it 'has a zone' do
    station = Station.new("Barbican", 1)
    expect(station.zone).to eq 1
  end
end
