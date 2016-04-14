require_relative '../spec_helper'

describe Turn do

  let(:hand1) {Hand.new(%w[8C TS KC 9H 4S])}
  let(:hand2) {Hand.new(%w[7D 2S 5D 3S AC])}
  let(:turn) {Turn.new(hand1, hand2)}

  it 'has many hands on initialization' do
    expect(self.hand1).to eq(hand1)
    expect(self.hand2).to eq(hand2)
  end

  it '#who_won returns either hand1 or hand2' do
    expect(turn.who_won).to eq('hand1')
  end

end