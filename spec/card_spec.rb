require 'card'

describe Card do

  let(:station){ double :station }

  before(:each) do
    @card = Card.new(10)
  end

  it 'Card has intialised amount' do
    expect(@card.balance).to eq 10
  end

  it 'Card has a default amount' do
    expect(subject.balance).to eq 0
  end

  it 'add money to card' do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  it "raises error if top up will go over card limit" do
    expect { subject.top_up(91) }.to raise_error "Top up would take balance over card limit - £#{Card::LIMIT}"
  end

  it 'starts a journey' do
    @card.touch_in(station)
    expect(@card.in_journey?).to eq true
  end

  it 'ends a journey' do
    @card.touch_in(station)
    @card.touch_out(station)
    expect(@card.in_journey?).to eq false
  end

  it "Doesn't allow you through the barrier if balance less than £1" do
    card = Card.new(0.99)
    expect { card.touch_in(station) }.to raise_error "You need a minimum balance of £#{Card::MINIMUM_FARE} to enter barrier."
  end

  it "deducts the journey cost from balance" do
    @card.touch_in(station)
    expect { @card.touch_out(station) }.to change{ @card.balance }.by(-(Card::MINIMUM_FARE))
  end

  it "Remembers the entry station" do
    @card.touch_in(station)
    expect(@card.entry_station).to eq station
  end

  it "clears the entry station" do
    @card.touch_in(station)
    @card.touch_out(station)
    expect(@card.entry_station).to eq nil
  end

  it 'Shows all journeys' do
    @card.touch_in('Barbican')
    @card.touch_out('St Pancras')
    @card.touch_in('St Pancras')
    @card.touch_out('Ashford')
    expect(@card.journey_history).to eq [{ entry_station: 'Barbican', exit_station: 'St Pancras' }, { entry_station: 'St Pancras', exit_station: 'Ashford' }]
  end

  it 'Raises an error if you try to touch out before touching in' do
    expect(@card.touch_out(station)).to eq "You didn't touch in, you will be charged a penalty fee of £#{Card::DEFAULT_CHARGE}"
  end

  it 'Charges if touching out without touching in' do
    expect { @card.touch_out(station) }.to change{ @card.balance }.by(-(Card::DEFAULT_CHARGE))
  end

  it 'Charges if touch in twice having never touched out' do
    @card.touch_in(station)
    expect(@card.touch_in(station)).to eq "You didn't touch out on your last journey, you will be charged a penalty fee of £#{Card::DEFAULT_CHARGE}"
  end

  it 'Charges if touch in twice having never touched out' do
    @card.touch_in(station)
    expect { @card.touch_in(station) }.to change{ @card.balance }.by(-(Card::DEFAULT_CHARGE))
  end
end
