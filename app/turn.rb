class Turn
  attr_reader :hand1, :hand2

  def initialize(hand1, hand2)
    @hand1 = hand1
    @hand2 = hand2
  end

  def who_won
    if higher_hand_catergory

    else tie_breaker

    end
  end

end