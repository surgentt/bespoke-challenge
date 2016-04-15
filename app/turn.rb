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
    elsif hand1_rating < hand2_rating
      self.category_winner = 'hand2'
    else
      self.category_winner = 'tie'
    end
  end

  def category_tie_breaker
    hand1.set_highest_card_in_category
    hand2.set_highest_card_in_category
    if hand1.best_int_card_in_category > hand2.best_int_card_in_category
      'hand1'
    elsif  hand1.best_int_card_in_category < hand2.best_int_card_in_category
      'hand2'
    else
      puts 'This tie NEVER happen'
    end
  end

end