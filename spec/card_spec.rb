require 'card'

describe Card do

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
    @card.touch_in
    expect(@card.in_journey?).to eq true
  end

  it 'ends a journey' do
    @card.touch_in
    @card.touch_out
    expect(@card.in_journey?).to eq false
  end

  it "Doesn't allow you through the barrier if balance less than £1" do
    card = Card.new(0.99)
    expect { card.touch_in }.to raise_error "You need a minimum balance of £#{Card::MINIMUM_FARE} to enter barrier."
  end

  it "deducts the journey cost from balance" do
    expect {@card.touch_out}.to change{@card.balance}.by(-(Card::MINIMUM_FARE))
  end
end
