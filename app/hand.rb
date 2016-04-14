class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def hello
    'Hello!'
  end

end