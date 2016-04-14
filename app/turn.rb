class Turn
  attr_reader :hand1, :hand2

  def initialize(hand1, hand2)
    @hand1 = hand1
    @hand2 = hand2
  end

  def who_won
    'hand1'
  end

end