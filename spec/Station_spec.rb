require './lib/Station'

describe Station do
  let(:station){ double :station }
  let(:zone){ double :zone }
  it 'Gives an entry station a name and a zone' do
    expect(subject.entry_station(station, zone)).to eq ({station=>zone})
  end
  it 'Gives an exit station a name and a zone' do
    expect(subject.exit_station(station, zone)).to eq ({station=>zone})
  end
  it 'Gives a full journey' do
    subject.entry_station(station, zone)
    subject.exit_station(station, zone)
    expect(subject.journey).to eq ( { :entry_station => {station=>zone}, :exit_station => {station=>zone} } )
  end
end
