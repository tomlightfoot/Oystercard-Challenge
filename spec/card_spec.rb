require 'card'

describe Card do
  it 'Card has intialised amount' do
    card = Card.new(10)
    expect(card.amount).to eq 10
  end

  it 'add money to card' do
    card = Card.new(5)
    card.add(10)
    expect(card.amount).to eq 15
  end

  it "Can't add more than £100 to a card" do
    card = Card.new(5)
    expect { card.add(106) }.to raise_error "Can't add more than £100"
  end

  it 'deducts fare from total on card' do
    card = Card.new(10)
    expect(card.deduct(5)).to eq 5
  end
end
