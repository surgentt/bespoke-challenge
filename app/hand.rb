class Hand
  HAND_CATEGORIES = ['High Card', 'One Pair', 'Two Pair', 'Three of a Kind', 'Straight', 'Flush', 'Full House', 'Four of a Kind', 'Straight Flush', 'Royal Flush']

  attr_reader :cards, :best_category
  attr_accessor :best_int_card_in_category

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

  def set_highest_card_in_category
    conversions = %w[T J Q K A]
    int_of_cards = self.cards.map do |card|
      if conversions.include?(card[0])
        conversions.index(card[0])+10
      else
        card[0].to_i
      end
    end
    self.best_int_card_in_category = int_of_cards.max
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