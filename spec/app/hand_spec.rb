require_relative '../spec_helper'

describe Hand do

  let(:hand1) {Hand.new(%w[8C TS KC 9H 4S])}
  let(:hand2) {Hand.new(%w[7D 2S 5D 3S AC])}

  it '#cards should return an array of cards' do
    expect(hand1.cards).to eq(%w[8C TS KC 9H 4S])
    expect(hand2.cards).to eq(%w[7D 2S 5D 3S AC])
  end

  it '#best_category returns the highest hand category that the player had' do
    expect(Hand::HAND_CATEGORIES.include?(hand1.best_category)).to eq(true)
  end

end