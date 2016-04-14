require_relative '../config/environment'

player1_wins = 0
player2_wins = 0

text=File.open('./lib/pocker.txt').read
text.each_line do |line|
  cards = line.split(' ')
  hand1 = Hand.new(cards[0..4])
  hand2 = Hand.new(cards[5..9])
  turn = Turn.new(hand1, hand2)
  winner = turn.who_won
  if winner == 'hand1'
    player1_wins += 1
  elsif winner == 'hand2'
    player2_wins += 1
  end
end

puts "Player 1 won #{player1_wins} times"
puts "Player 2 won #{player2_wins} times"
if player1_wins > player2_wins
  'Player one is the better player'
else
  'Player two is the better player'
end