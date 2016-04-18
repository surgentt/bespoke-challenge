require_relative '../spec_helper'

describe Hand do

  it '#cards should return an array of cards' do
    hand1 = Hand.new(%w[8C TS KC 9H 4S])
    hand2 = Hand.new(%w[7D 2S 5D 3S AC])
    expect(hand1.cards).to eq(%w[8C TS KC 9H 4S])
    expect(hand2.cards).to eq(%w[7D 2S 5D 3S AC])
  end

  it '#best_category always returns one of the Hand Category' do
    hand1 = Hand.new(%w[8C TS KC 9H 4S])
    expect(Hand::HAND_CATEGORIES.include?(hand1.best_category)).to eq(true)
  end

  it '#best_category returns a specific category' do
    hand1 = Hand.new(%w[8C TS KC 9H 4S])
    expect(hand1.best_category).to eq('High Card')
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

  it '#straight? does NOT detect a staight if one off', focus:true do
      hand_b = Hand.new(%w[KD 9D 7C AS JS']) # High Card, but identified as a straight
      expect(hand_b.best_category).to eq('High Card')
  end

  it '#straight? detects if All cards are consecutive values with A being low as well' do
    hand = Hand.new(%w[AS 2D 3D 4H 5D])
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

  it '#get_best_category returns High Card if nothing else if detected' do
    hand = Hand.new(%w[2C 3S 8S 7D TD])
    expect(hand.best_category).to eq('High Card')
  end

  describe '#set_highest_card_in_category in the event of tie' do

    it 'in the event of a One Pair it find the highest for the two pair' do
      hand = Hand.new(%w[2C 3S TS 8D 8D])
      hand.set_highest_card_in_category
      expect(hand.best_int_card_sorted).to eq([2, 3, 10, 8])
    end

    it 'in the event of a Two Pair it find the highest for the two pair' do
      hand = Hand.new(%w[2C TS TS 8D 8D])
      hand.set_highest_card_in_category
      expect(hand.best_int_card_sorted).to eq([2, 8, 10])
    end

    it 'in the event of a Three of a Kind it find the highest for the two pair' do
      hand = Hand.new(%w[3D 9C 2S 2H 2C])
      hand.set_highest_card_in_category
      expect(hand.best_int_card_sorted).to eq([3, 9, 2])
    end

    it 'in the event of a Straight it return a sorted array' do
      hand = Hand.new(%w[3D 4H 5D 6D 7D])
      hand.set_highest_card_in_category
      expect(hand.best_int_card_sorted).to eq([3, 4, 5, 6, 7])
    end

    it 'in the event of a Flush return the highest card' do
      hand = Hand.new(%w[3S 8S 2S 9S KS])
      hand.set_highest_card_in_category
      expect(hand.best_int_card_sorted).to eq([2, 3, 8, 9, 13])
    end

    it 'in the event of a Full House it find the highest for the two pair' do
      hand = Hand.new(%w[4H 4D 2C 2D 2S])
      hand.set_highest_card_in_category
      expect(hand.best_int_card_sorted).to eq([4, 2])
    end

    it 'in the event of a Full House it find the highest for the two pair' do
      hand = Hand.new(%w[4H 4D 4C 2D 2S])
      hand.set_highest_card_in_category
      expect(hand.best_int_card_sorted).to eq([2, 4])
    end

    it 'in the event of a Four of a Kind it find the highest for the two pair' do
      hand = Hand.new(%w[KS TS TH TD TC])
      hand.set_highest_card_in_category
      expect(hand.best_int_card_sorted).to eq([13, 10])
    end

    it 'in the event of any straight it just returns the sorted cards' do
      hand = Hand.new(%w[3D 4H 5D 6D 7D])
      hand.set_highest_card_in_category
      expect(hand.best_int_card_sorted).to eq([3,4,5,6,7])
    end

  end

end