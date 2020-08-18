BUST_TOTAL = 21
TOTAL_BELOW_WHICH_DEALER_MUST_HIT = 17
NUM_POINTS_TO_WIN = 5

CLUBS = 'clubs'
DIAMONDS = 'diamonds'
HEARTS = 'hearts'
SPADES = 'spades'

SUITS = [CLUBS, DIAMONDS, HEARTS, SPADES]

CARD_NAME = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def prompt_no_new_line(msg)
  print "=> #{msg}"
end

# Deck will be an array. Each element is a hash that represents a card
# E.g., King diamonds:  {:name=>"Kd", :value=>10}
def init_deck
  deck = []
  SUITS.each do |suit|
    suit_first_letter = suit.chr
    rank = 2
    CARD_NAME.each do |name|
      card_hash = {}
      card_hash[:name] = name + suit_first_letter # E.g., Ah (for Ace of hearts)
      # card_hash[:rank] = rank
      # card_hash[:suit] = suit
      if rank <= 10
        value = rank
      elsif rank <= 13
        value = 10
      else
        value = 11
      end
      card_hash[:value] = value
      deck << card_hash
      rank += 1
    end
  end
  deck
end

def shuffle!(deck)
  shuffled_deck = []
  remaining_cards = deck.size
  num_cards = remaining_cards
  for i in 0..(num_cards - 1)
    random_index = rand(remaining_cards)
    # Copy card to shuffled deck
    shuffled_deck[i] = deck[random_index]
    # Delete the original element
    deck.delete_at(random_index)
    remaining_cards -= 1
  end
  if num_cards != shuffled_deck.size
    puts "num_cards != shuffled_deck.size !!!!!!!!!!!!!!!!!!"
  end
  # Copy shuffled deck back to passed in deck
  shuffled_deck.each_with_index do |card, index|
    deck[index] = card
  end
end

def display_player_hand(hand)
  prompt_no_new_line "Player's hand: "
  hand.each do |card|
    print card[:name]
    print ' '
  end
  puts ""
end

def display_dealer_hand(hand)
  prompt_no_new_line "Dealer's hand: "
  hand.each do |card|
    print card[:name]
    print ' '
  end
  puts ""
end

def display_dealer_upcard(hand)
  prompt "Dealer's up card: #{hand[0][:name]}"
end

def display_dealer_downcard(hand)
  prompt "(Dealer's down card: #{hand[1][:name]})"
end

def deal_card!(deck)
  deck.shift
end

def deal_a_hand!(dealer_hand, player_hand, deck)
  player_hand << deal_card!(deck)
  dealer_hand << deal_card!(deck)
  player_hand << deal_card!(deck)
  dealer_hand << deal_card!(deck)
end

def get_hand_total(hand)
  hand_total = hand.reduce(0) { |total, card| total + card[:value] }

  if hand_total > BUST_TOTAL
    aces_arr = hand.select { |card| card[:value] == 11 }
    num_aces = aces_arr.size
    while num_aces > 0 && hand_total > BUST_TOTAL
      hand_total -= 10
      num_aces -= 1
    end
  end
  hand_total
end

def complete_players_hand_to_get_total(player_hand, deck)
  prompt("Player's turn: ")
  hand_total = get_hand_total(player_hand)
  loop do
    busted = false
    prompt("Do you want to hit or stay ('h' or 's')?")
    player_action = gets.chomp

    if player_action == 'h'
      # Deal a card off the top the deck
      player_hand << deal_card!(deck)

      display_player_hand(player_hand)

      # Sum up all the player cards (and treat aces)
      hand_total = get_hand_total(player_hand)

      busted = hand_total > BUST_TOTAL
    end

    break if player_action == 's' || busted
  end
  hand_total
end

def complete_dealers_hand_to_get_total(dealer_hand, deck)
  prompt("Dealer's turn: ")

  display_dealer_hand(dealer_hand)

  hand_total = get_hand_total(dealer_hand)

  while hand_total < TOTAL_BELOW_WHICH_DEALER_MUST_HIT
    prompt "Dealer takes a card: "
    dealer_hand << deal_card!(deck)

    display_dealer_hand(dealer_hand)

    # Sum up all the dealer cards (and treat aces)
    hand_total = get_hand_total(dealer_hand)
  end
  hand_total
end

loop do
  puts ""
  puts "New group of hands"

  num_dealer_wins = 0
  num_player_wins = 0
  loop do
    puts ""
    puts "New hand"

    # Initialize deck
    deck = init_deck
    # puts "Initial deck"
    # puts deck

    # Shuffle the deck each hand
    shuffle!(deck)

    # puts "Shuffled deck"
    # puts deck

    player_hand = []
    dealer_hand = []

    # Deal a hand
    deal_a_hand!(dealer_hand, player_hand, deck)

    display_dealer_upcard(dealer_hand)
    # display_dealer_downcard(dealer_hand)
    display_player_hand(player_hand)

    player_total = complete_players_hand_to_get_total(player_hand, deck)

    hand_result = 'unresolved'

    # Dealer wins if player busted
    if player_total > BUST_TOTAL
      prompt("Player busted (hand total: #{player_total})")
      hand_result = 'Dealer wins'
    else
      # Dealer's turn
      dealer_total = complete_dealers_hand_to_get_total(dealer_hand, deck)

      # Player wins if dealer busted
      if dealer_total > BUST_TOTAL
        prompt("Dealer busted (hand total: #{dealer_total})")
        hand_result = 'Player wins'
      end
    end

    # If neither busted
    if hand_result == 'unresolved'
      prompt("Dealer hand total: #{dealer_total}")
      prompt("Player hand total: #{player_total}")

      if player_total > dealer_total
        hand_result = 'Player wins'
      elsif dealer_total > player_total
        hand_result = 'Dealer wins'
      else
        hand_result = "It's a tie"
      end
    end

    prompt(hand_result)

    # Accumulate winning points
    if hand_result == 'Dealer wins'
      num_dealer_wins += 1
    elsif hand_result == 'Player wins'
      num_player_wins += 1
    end

    prompt "Group wins: dealer = #{num_dealer_wins}. player = #{num_player_wins}"

    break if  (num_dealer_wins >= NUM_POINTS_TO_WIN) ||
              (num_player_wins >= NUM_POINTS_TO_WIN)
  end

  # There is a winner of the group of hands
  if num_dealer_wins >= NUM_POINTS_TO_WIN
    prompt "Dealer wins the group of hands"
  else
    prompt "Player wins the group of hands"
  end

  prompt("Play again? ('y' or 'n)")
  answer = gets.chomp
  break if answer.downcase != 'y'
end

prompt("Thanks for playing! Good bye!")

# Andys-MacBook-Pro:lesson_6 andywitek$ ruby twentyone.rb

# New group of hands

# New hand
# => Dealer's up card: 5d
# => Player's hand: 6c 6h 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 5d 9s 
# => Dealer takes a card: 
# => Dealer's hand: 5d 9s Ad 
# => Dealer takes a card: 
# => Dealer's hand: 5d 9s Ad 2d 
# => Dealer hand total: 17
# => Player hand total: 12
# => Dealer wins
# => Group wins: dealer = 1. player = 0

# New hand
# => Dealer's up card: Jc
# => Player's hand: Kc 8d 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Jc Ah 
# => Dealer hand total: 21
# => Player hand total: 18
# => Dealer wins
# => Group wins: dealer = 2. player = 0

# New hand
# => Dealer's up card: Qd
# => Player's hand: Ks 6s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: Ks 6s 2s 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Qd 9d 
# => Dealer hand total: 19
# => Player hand total: 18
# => Dealer wins
# => Group wins: dealer = 3. player = 0

# New hand
# => Dealer's up card: 9s
# => Player's hand: 5h Qc 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 5h Qc 2h 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 9s 3d 
# => Dealer takes a card: 
# => Dealer's hand: 9s 3d 2d 
# => Dealer takes a card: 
# => Dealer's hand: 9s 3d 2d Jh 
# => Dealer busted (hand total: 24)
# => Player wins
# => Group wins: dealer = 3. player = 1

# New hand
# => Dealer's up card: Qh
# => Player's hand: 8s 4s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 8s 4s 7s 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Qh 2s 
# => Dealer takes a card: 
# => Dealer's hand: Qh 2s Jh 
# => Dealer busted (hand total: 22)
# => Player wins
# => Group wins: dealer = 3. player = 2

# New hand
# => Dealer's up card: Js
# => Player's hand: 6s Kc 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 6s Kc Kd 
# => Player busted (hand total: 26)
# => Dealer wins
# => Group wins: dealer = 4. player = 2

# New hand
# => Dealer's up card: 3d
# => Player's hand: Th Td 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 3d Qh 
# => Dealer takes a card: 
# => Dealer's hand: 3d Qh 9c 
# => Dealer busted (hand total: 22)
# => Player wins
# => Group wins: dealer = 4. player = 3

# New hand
# => Dealer's up card: 5c
# => Player's hand: 2c Qc 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 5c As 
# => Dealer takes a card: 
# => Dealer's hand: 5c As 7d 
# => Dealer takes a card: 
# => Dealer's hand: 5c As 7d 8h 
# => Dealer hand total: 21
# => Player hand total: 12
# => Dealer wins
# => Group wins: dealer = 5. player = 3
# => Dealer wins the group of hands
# => Play again? ('y' or 'n)
# y

# New group of hands

# New hand
# => Dealer's up card: 7s
# => Player's hand: 2c 6h 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 2c 6h 5s 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 2c 6h 5s Qs 
# => Player busted (hand total: 23)
# => Dealer wins
# => Group wins: dealer = 1. player = 0

# New hand
# => Dealer's up card: Ts
# => Player's hand: 4s 8s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 4s 8s Ks 
# => Player busted (hand total: 22)
# => Dealer wins
# => Group wins: dealer = 2. player = 0

# New hand
# => Dealer's up card: Qs
# => Player's hand: Th As 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Qs Jh 
# => Dealer hand total: 20
# => Player hand total: 21
# => Player wins
# => Group wins: dealer = 2. player = 1

# New hand
# => Dealer's up card: 3c
# => Player's hand: 8d 9d 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 3c 8c 
# => Dealer takes a card: 
# => Dealer's hand: 3c 8c Th 
# => Dealer hand total: 21
# => Player hand total: 17
# => Dealer wins
# => Group wins: dealer = 3. player = 1

# New hand
# => Dealer's up card: Ac
# => Player's hand: 8s Ts 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Ac 2h 
# => Dealer takes a card: 
# => Dealer's hand: Ac 2h 9d 
# => Dealer takes a card: 
# => Dealer's hand: Ac 2h 9d 7c 
# => Dealer hand total: 19
# => Player hand total: 18
# => Dealer wins
# => Group wins: dealer = 4. player = 1

# New hand
# => Dealer's up card: 4d
# => Player's hand: 5s 6c 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 5s 6c 4s 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 4d 6h 
# => Dealer takes a card: 
# => Dealer's hand: 4d 6h Qc 
# => Dealer hand total: 20
# => Player hand total: 15
# => Dealer wins
# => Group wins: dealer = 5. player = 1
# => Dealer wins the group of hands
# => Play again? ('y' or 'n)
# y

# New group of hands

# New hand
# => Dealer's up card: Kh
# => Player's hand: Qd 7c 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Kh 8h 
# => Dealer hand total: 18
# => Player hand total: 17
# => Dealer wins
# => Group wins: dealer = 1. player = 0

# New hand
# => Dealer's up card: 6d
# => Player's hand: Qd 6s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: Qd 6s 5c 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 6d Js 
# => Dealer takes a card: 
# => Dealer's hand: 6d Js 3d 
# => Dealer hand total: 19
# => Player hand total: 21
# => Player wins
# => Group wins: dealer = 1. player = 1

# New hand
# => Dealer's up card: 9s
# => Player's hand: 8c Ts 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 9s Qd 
# => Dealer hand total: 19
# => Player hand total: 18
# => Dealer wins
# => Group wins: dealer = 2. player = 1

# New hand
# => Dealer's up card: Ks
# => Player's hand: Ad 2d 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: Ad 2d 4d 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: Ad 2d 4d Qs 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Ks 7c 
# => Dealer hand total: 17
# => Player hand total: 17
# => It's a tie
# => Group wins: dealer = 2. player = 1

# New hand
# => Dealer's up card: 7d
# => Player's hand: 4c 7s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 4c 7s Qc 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 7d 8h 
# => Dealer takes a card: 
# => Dealer's hand: 7d 8h Js 
# => Dealer busted (hand total: 25)
# => Player wins
# => Group wins: dealer = 2. player = 2

# New hand
# => Dealer's up card: 2s
# => Player's hand: 3s Jc 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 3s Jc Ad 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 3s Jc Ad 7h 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 2s 5c 
# => Dealer takes a card: 
# => Dealer's hand: 2s 5c Kh 
# => Dealer hand total: 17
# => Player hand total: 21
# => Player wins
# => Group wins: dealer = 2. player = 3

# New hand
# => Dealer's up card: 9s
# => Player's hand: 3s 5c 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 3s 5c 2s 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 3s 5c 2s 2c 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 3s 5c 2s 2c 4c 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 9s Ad 
# => Dealer hand total: 20
# => Player hand total: 16
# => Dealer wins
# => Group wins: dealer = 3. player = 3

# New hand
# => Dealer's up card: Th
# => Player's hand: Ah Ks 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Th 6d 
# => Dealer takes a card: 
# => Dealer's hand: Th 6d 9h 
# => Dealer busted (hand total: 25)
# => Player wins
# => Group wins: dealer = 3. player = 4

# New hand
# => Dealer's up card: 4s
# => Player's hand: 9s Ah 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 4s 3d 
# => Dealer takes a card: 
# => Dealer's hand: 4s 3d 8c 
# => Dealer takes a card: 
# => Dealer's hand: 4s 3d 8c Qc 
# => Dealer busted (hand total: 25)
# => Player wins
# => Group wins: dealer = 3. player = 5
# => Player wins the group of hands
# => Play again? ('y' or 'n)
# n
# => Thanks for playing! Good bye!
