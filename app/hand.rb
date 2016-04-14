class Hand
  HAND_CATEGORIES = ['High Card', 'One Pair', 'Two Pair', 'Three of a Kind', 'Straight', 'Flush', 'Full House', 'Four of a Kind', 'Straight Flush', 'Royal Flush']

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def best_category
    if royal_flush?
      self.hand_category 'Royal Flush'
    elsif straight_flush?
      'Straight Flush'
    elsif four_of_a_kind?
      'Four of a Kind'
    elsif full_house?
      'Full House'
    elsif flush?
      'Flush'
    elsif straight?
      'Straight'
    elsif three_of_a_kind?
      'Three of a Kind'
    elsif two_pair?
      'Two Pair'
    elsif one_pair?
      'One Pair'
    else
      high_card
    end
  end

  private

  def royal_flush?
    false
  end

  def straight_flush?
    false
  end

  def four_of_a_kind?
    false
  end

  def full_house?
    false
  end

  def flush?
    false
  end

  def straight?
    false
  end

  def three_of_a_kind?
    false
  end

  def two_pair?
    false
  end

  def one_pair?
    false
  end

  def high_card
    'High Card'
  end

end