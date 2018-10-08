require 'card'

describe Card do
  it 'Card has intialised amount' do
    card = Card.new(10)
    expect(card.balance).to eq 10
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

  it 'deducts fare from total on card' do
    card = Card.new(10)
    expect(card.deduct(5)).to eq 5
  end

  it 'starts a journey' do
    subject.touch_in
    expect(subject.in_journey?).to eq true
  end

  it 'ends a journey' do
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to eq false
  end
end
