require './lib/Journey.rb'

describe Journey do
  let(:station){ double :station }
  let(:zone){ double :zone }
  it 'initialize an empty journey' do
    expect(subject.journey).to eq ({ })
  end

  it 'initialize an empty journey history' do
    expect(subject.journey_history).to eq []
  end
end
