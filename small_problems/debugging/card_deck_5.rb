# Card Deck

# We started working on a card game but got stuck. Check out why the code below raises a TypeError.

# Once you get the program to run and produce a sum, you might notice that the sum is off: It's lower than it should be. Why is that?

# Added separate arrays, one for each suit
hearts_cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
diamonds_cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
club_cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
spades_cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => hearts_cards,
         :diamonds => diamonds_cards,
         :clubs    => club_cards,
         :spades   => spades_cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
  puts "suit = #{suit}   player_cards = #{player_cards}"
end

# Determine the score of the remaining cards in the deck

# Replaces 'Original' code below
sum = deck.reduce(0) do |sum, (key, remaining_cards)|
  remaining_cards.each do |card|
    sum += score(card)
  end
  sum
end

# Original
# sum = deck.reduce(0) do |sum, (_, remaining_cards)|
#   remaining_cards.map do |card|
#     score(card)
#   end

#   sum += remaining_cards.sum
# end


puts sum