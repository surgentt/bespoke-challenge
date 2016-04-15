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

  it '#best_int_card_in_category return the highest integer rating of card for a specific category' do

  end

  it '#set_highest_card_in_category sets the highest card based upon the category' do

  end

  it '#royal_flush? detects Ten, Jack, Queen, King, Ace, in same suit'  do
    hand = Hand.new(%w[TS JS QS KS AS])
    expect(hand.best_category).to eq('Royal Flush')
  end

  it '#straight_flush? detects All cards are consecutive values of same suit.' do
    hand = Hand.new(%w[9S TS JS QS KS])
    expect(hand.best_category).to eq('Straight Flush')
  end

  it '#four_of_a_kind? detects Four cards of the same value' do
    hand = Hand.new(%w[TS TH TD TC KS])
    expect(hand.best_category).to eq('Four of a Kind')
  end

  it '#four_of_a_kind? detects Four cards of the same value' do
    hand = Hand.new(%w[KS TS TH TD TC])
    expect(hand.best_category).to eq('Four of a Kind')
  end

  it '#full_house? detect Three of a kind and a pair' do
    hand = Hand.new(%w[2H 2D 4C 4D 4S])
    expect(hand.best_category).to eq('Full House')
  end

  it '#flush? detect if all cards are the same suit' do
    hand = Hand.new(%w[3S 8S 2S 9S KS])
    expect(hand.best_category).to eq('Flush')
  end

  it '#straight? detects if All cards are consecutive values.' do
    hand = Hand.new(%w[3D 4H 5D 6D 7D])
    expect(hand.best_category).to eq('Straight')
  end

  it '#three_of_a_kind? detects if Three cards of the same value.' do
    hand = Hand.new(%w[2D 9C AS AH AC])
    expect(hand.best_category).to eq('Three of a Kind')
  end

  it '#three_of_a_kind? detects if Three cards of the same value.' do
    hand = Hand.new(%w[2D 9C AS AH AC])
    expect(hand.best_category).to eq('Three of a Kind')
  end

  it '#two_pair? detect Two different pairs.' do
    hand = Hand.new(%w[2C 3S 3S 8D 8D])
    expect(hand.best_category).to eq('Two Pair')
  end

  it '#one_pair? detects Two cards of the same value.' do
    hand = Hand.new(%w[2C 3S 8S 8D TD])
    expect(hand.best_category).to eq('One Pair')
end

end