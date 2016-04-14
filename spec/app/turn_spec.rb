require_relative '../spec_helper'

describe Turn do

  let(:hand1) {Hand.new(%w[8C TS KC 9H 4S])}
  let(:hand2) {Hand.new(%w[7D 2S 5D 3S AC])}
  let(:turn) {Turn.new(hand1, hand2)}

  it 'has many hands on initialization' do
    expect(self.hand1).to eq(hand1)
    expect(self.hand2).to eq(hand2)
  end

  it '#winner returns either hand1 or hand2' do
    expect(%w[hand1 hand2].include?(turn.winner)).to eq(true)
  end

  it '#category_winner returns either hand1, hand2 or tie. This will prevent further processsing' do
    expect(%w[hand1 hand2 tie].include?(turn.category_winner)).to eq(true)
  end

  it '#highest_hand_category checks the best categories of a hand and return the highest' do

  end

  it '#category_tie_breaker asks the hand for the highest card in their category and returns data' do

  end


end