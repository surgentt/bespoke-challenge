class Turn
  attr_reader :hand1, :hand2
  attr_accessor :category_winner, :winner

  def initialize(hand1, hand2)
    @hand1 = hand1
    @hand2 = hand2
    highest_hand_category
    if self.category_winner == 'hand1' || self.category_winner == 'hand2'
      self.winner = self.category_winner
    elsif self.category_winner == 'tie'
      self.winner = self.category_tie_breaker
    end
  end

  def highest_hand_category
    hand1_rating = Hand::HAND_CATEGORIES.index(hand1.best_category)
    hand2_rating = Hand::HAND_CATEGORIES.index(hand2.best_category)
    if hand1_rating > hand2_rating
      self.category_winner = 'hand1'
    elsif hand2_rating > hand1_rating
      self.category_winner = 'hand2'
    else
      self.category_winner = 'tie'
    end
  end

  def category_tie_breaker
    # Only request for the highest card from hands if that knowledge is required
    'hand1' # place holder
  end

end