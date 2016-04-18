class Hand
  HAND_CATEGORIES = ['High Card', 'One Pair', 'Two Pair', 'Three of a Kind', 'Straight', 'Flush', 'Full House', 'Four of a Kind', 'Straight Flush', 'Royal Flush']

  attr_reader :cards, :best_category, :int_of_cards
  attr_accessor :int_count_arr, :best_int_card_sorted

  def initialize(cards)
    @cards = cards
    @int_of_cards = convert_face_to_int
    @best_category = get_best_category
    @best_int_card_sorted = []
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

  def convert_face_to_int
    conversions = %w[T J Q K A]
    self.cards.map{ |card|
      if conversions.include?(card[0])
        conversions.index(card[0])+10
      else
        card[0].to_i
      end
    }.sort
  end

  def royal_flush?
    self.int_of_cards == [10, 11, 12, 13, 14] && flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    self.int_count_arr = self.int_of_cards.map{|int_of_card| self.int_of_cards.count(int_of_card)}
    self.int_count_arr.include?(4)
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def flush?
    self.cards.map{|i| i[1]}.uniq.length==1
  end

  def straight?
    check = false
    i = 1
    while i < self.int_of_cards.length do
      check = (self.int_of_cards[i] - self.int_of_cards[i-1] == 1)
      i+=1
    end
    check
  end

  def three_of_a_kind?
    self.int_count_arr.include?(3)
  end

  def two_pair?
    self.int_count_arr.count(2) == 4
  end

  def one_pair?
    self.int_count_arr.include?(2)
  end

  # Tie Break methods

  def set_highest_card_in_category
    case self.best_category
    when 'Royal Flush'
      self.best_int_card_sorted = self.int_of_cards
    when 'Straight Flush'
      self.best_int_card_sorted = self.int_of_cards
    when 'Four of a Kind'
      self.best_int_card_sorted = sort_pairs(4)
    when 'Full House'
      self.best_int_card_sorted = sort_flush
    when 'Flush'
      self.best_int_card_sorted = self.int_of_cards
    when 'Straight'
      self.best_int_card_sorted = self.int_of_cards
    when 'Three of a Kind'
      self.best_int_card_sorted = sort_pairs(3)
    when 'Two Pair'
      self.best_int_card_sorted = sort_pairs(2)
    when 'One Pair'
      self.best_int_card_sorted = sort_pairs(2)
    else # High Card
      self.best_int_card_sorted = self.int_of_cards
    end
  end

  def sort_pairs(num_of_card_pairs)
    hand_match = []
    top_other_cards = []
    i = 0
    while i < self.int_of_cards.length do
      if self.int_of_cards[i] == self.int_of_cards[i+1]
        hand_match << self.int_of_cards[i]
        i+=num_of_card_pairs-1
      else
        top_other_cards << self.int_of_cards[i]
      end
      i+=1
    end
    [top_other_cards, hand_match].flatten
  end

  def sort_flush
    if self.int_of_cards[0] == self.int_of_cards[2]
      arr = [self.int_of_cards[-1], self.int_of_cards[0]]
    else
      arr = [self.int_of_cards[0], self.int_of_cards[-1]]
    end
    arr
  end

end