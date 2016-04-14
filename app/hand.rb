class Hand
  HAND_CATEGORIES = ['High Card', 'One Pair', 'Two Pair', 'Three of a Kind', 'Straight', 'Flush', 'Full House', 'Four of a Kind', 'Straight Flush', 'Royal Flush']

  attr_reader :cards, :best_category

  def initialize(cards)
    @cards = cards
    @best_category = self.get_best_category
  end

  def get_best_category
    if royal_flush?
      'Royal Flush'
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
      'High Card'
    end
  end

  def highest_card_in_category
    # needs to return the highest card for best category
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

end