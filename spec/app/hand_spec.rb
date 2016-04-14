require_relative '../spec_helper'

describe Hand do

  let(:hand1) {Hand.new(%w[8C TS KC 9H 4S])}
  let(:hand2) {Hand.new(%w[7D 2S 5D 3S AC])}

  it '#cards should return an array of cards' do
    expect(hand1.cards).to eq(%w[8C TS KC 9H 4S])
    expect(hand2.cards).to eq(%w[7D 2S 5D 3S AC])
  end

  it '#best_category always returns one of the Hand Category' do
    expect(Hand::HAND_CATEGORIES.include?(hand1.best_category)).to eq(true)
  end

  it '#best_category returns a specific category' do
    expect(hand1.best_category).to eq('High Card')
  end

end