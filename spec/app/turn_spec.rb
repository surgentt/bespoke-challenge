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

  describe '#category_tie_break compares two hands and returns the winner' do

    it 'picks a winner for a two_pair' do
      hand_a = Hand.new(%w[5H 5C 6S 7S KD]) # Pair of Fives
      hand_b = Hand.new(%w[2C 3S 8S 8D TD]) # Pair of Eights
      turn = Turn.new(hand_a, hand_b)
      expect(turn.winner).to eq('hand2')
    end

    it 'picks a winner for a high_card' do
      hand_a = Hand.new(%w[5D 8C 9S JS AC]) # Highest card Ace
      hand_b = Hand.new(%w[2C 5C 7D 8S QH]) # Highest card Queen
      turn = Turn.new(hand_a, hand_b)
      expect(turn.winner).to eq('hand1')
    end

    it 'picks a winner for two different categories' do
      hand_a = Hand.new(%w[2D 9C AS AH AC]) # Three aces
      hand_b = Hand.new(%w[3D 6D 7D TD QD]) # Flush with Diamonds
      turn = Turn.new(hand_a, hand_b)
      expect(turn.winner).to eq('hand2')
    end

    it 'picks a winner on the second best card for a Pair' do
      hand_a = Hand.new(%w[4D 6S 9H QH QC]) # Pair of Queens, Highest card Nine
      hand_b = Hand.new(%w[3D 6D 7H QD QS]) # Pair of Queens, Highest card Seven
      turn = Turn.new(hand_a, hand_b)
      expect(turn.winner).to eq('hand1')
    end

    it 'picks a winner on the second best card for Full House', foucs:true do
      hand_a = Hand.new(%w[2H 2D 4C 4D 4S]) # Full House, With Three Fours
      hand_b = Hand.new(%w[3C 3D 3S 9S 9D]) # Full House, with Three Threes
      turn = Turn.new(hand_a, hand_b)
      expect(turn.winner).to eq('hand1')
    end

  end

end