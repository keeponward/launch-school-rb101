CLUBS = 'clubs'
DIAMONDS = 'diamonds'
HEARTS = 'hearts'
SPADES = 'spades'

SUITS = [CLUBS, DIAMONDS, HEARTS, SPADES]

CARD_NAME = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']

BEST_HAND_TOTAL = 21
DEALER_STAY_TOTAL = 17

NUM_POINTS_TO_WIN = 5

FACE_CARD_VALUE = 10
ACE_VALUE = 11

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
      # If 10 or lower
      if rank <= 10
        value = rank
      # Else if a face card (J, Q, or K)
      elsif rank <= 13
        value = FACE_CARD_VALUE
      # Else ace (A)
      else
        value = ACE_VALUE
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

  if hand_total > BEST_HAND_TOTAL
    aces_arr = hand.select { |card| card[:value] == ACE_VALUE }
    num_aces = aces_arr.size
    while (num_aces > 0) && (hand_total > BEST_HAND_TOTAL)
      hand_total -= 10
      num_aces -= 1
    end
  end
  hand_total
end

def complete_players_hand(player_hand, deck)
  prompt("Player's turn: ")
  hand_total = get_hand_total(player_hand)
  loop do
    prompt("Do you want to hit or stay ('h' or 's')?")
    player_action = gets.chomp

    if player_action == 'h'
      # Deal a card off the top the deck
      player_hand << deal_card!(deck)

      display_player_hand(player_hand)

      hand_total += player_hand.last[:value]

      # If new hand total exceeds best possible total and if any aces are present
      if (hand_total > BEST_HAND_TOTAL) &&
         player_hand.any? { |card| card[:value] == ACE_VALUE }
        # Sum up all the player cards (and treat aces)
        hand_total = get_hand_total(player_hand)
      end
    end
    break if player_action == 's' || (hand_total > BEST_HAND_TOTAL)
  end
  hand_total
end

def complete_dealers_hand(dealer_hand, deck)
  prompt("Dealer's turn: ")

  display_dealer_hand(dealer_hand)

  hand_total = get_hand_total(dealer_hand)

  while hand_total < DEALER_STAY_TOTAL
    prompt "Dealer takes a card: "
    dealer_hand << deal_card!(deck)

    display_dealer_hand(dealer_hand)

    hand_total += dealer_hand.last[:value]

    # If new hand total exceeds best possible total and if any aces are present
    if (hand_total > BEST_HAND_TOTAL) &&
       dealer_hand.any? { |card| card[:value] == ACE_VALUE }
      # Sum up all the player cards (and treat aces)
      hand_total = get_hand_total(dealer_hand)
    end
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

    player_total = complete_players_hand(player_hand, deck)

    hand_result = 'unresolved'

    # Dealer wins if player busted
    if player_total > BEST_HAND_TOTAL
      prompt("Player busted (hand total: #{player_total})")
      hand_result = 'Dealer wins'
    else
      # Dealer's turn
      dealer_total = complete_dealers_hand(dealer_hand, deck)

      # Player wins if dealer busted
      if dealer_total > BEST_HAND_TOTAL
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

# New group of hands

# New hand
# => Dealer's up card: 5s
# => Player's hand: 3h Ah 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 3h Ah 7c 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 5s 5h 
# => Dealer takes a card: 
# => Dealer's hand: 5s 5h 6h 
# => Dealer takes a card: 
# => Dealer's hand: 5s 5h 6h 8s 
# => Dealer busted (hand total: 24)
# => Player wins
# => Group wins: dealer = 0. player = 1

# New hand
# => Dealer's up card: Kh
# => Player's hand: 8d 2d 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 8d 2d Ks 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Kh Jh 
# => Dealer hand total: 20
# => Player hand total: 20
# => It's a tie
# => Group wins: dealer = 0. player = 1

# New hand
# => Dealer's up card: 3c
# => Player's hand: Ac 2d 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: Ac 2d As 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: Ac 2d As 3s 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: Ac 2d As 3s Ks 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 3c 4h 
# => Dealer takes a card: 
# => Dealer's hand: 3c 4h Qh 
# => Dealer hand total: 17
# => Player hand total: 17
# => It's a tie
# => Group wins: dealer = 0. player = 1

# New hand
# => Dealer's up card: 5c
# => Player's hand: Qh 5s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 5c 3h 
# => Dealer takes a card: 
# => Dealer's hand: 5c 3h 3s 
# => Dealer takes a card: 
# => Dealer's hand: 5c 3h 3s 2c 
# => Dealer takes a card: 
# => Dealer's hand: 5c 3h 3s 2c 8s 
# => Dealer hand total: 21
# => Player hand total: 15
# => Dealer wins
# => Group wins: dealer = 1. player = 1

# New hand
# => Dealer's up card: Ad
# => Player's hand: 6h Td 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 6h Td As 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Ad Qd 
# => Dealer hand total: 21
# => Player hand total: 17
# => Dealer wins
# => Group wins: dealer = 2. player = 1

# New hand
# => Dealer's up card: Ah
# => Player's hand: 3s Th 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 3s Th 9d 
# => Player busted (hand total: 22)
# => Dealer wins
# => Group wins: dealer = 3. player = 1

# New hand
# => Dealer's up card: 7s
# => Player's hand: Tc 2h 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: Tc 2h 8d 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 7s Kh 
# => Dealer hand total: 17
# => Player hand total: 20
# => Player wins
# => Group wins: dealer = 3. player = 2

# New hand
# => Dealer's up card: 2s
# => Player's hand: Tc 5c 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 2s 2c 
# => Dealer takes a card: 
# => Dealer's hand: 2s 2c 7h 
# => Dealer takes a card: 
# => Dealer's hand: 2s 2c 7h Jh 
# => Dealer hand total: 21
# => Player hand total: 15
# => Dealer wins
# => Group wins: dealer = 4. player = 2

# New hand
# => Dealer's up card: 2s
# => Player's hand: 6s 8h 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 6s 8h 8d 
# => Player busted (hand total: 22)
# => Dealer wins
# => Group wins: dealer = 5. player = 2
# => Dealer wins the group of hands
# => Play again? ('y' or 'n)
# y

# New group of hands

# New hand
# => Dealer's up card: 7s
# => Player's hand: Ac Ah 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: Ac Ah 8d 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 7s Qc 
# => Dealer hand total: 17
# => Player hand total: 20
# => Player wins
# => Group wins: dealer = 0. player = 1

# New hand
# => Dealer's up card: 8s
# => Player's hand: Ad 8d 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 8s Th 
# => Dealer hand total: 18
# => Player hand total: 19
# => Player wins
# => Group wins: dealer = 0. player = 2

# New hand
# => Dealer's up card: 4h
# => Player's hand: 6h 6d 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 6h 6d Tc 
# => Player busted (hand total: 22)
# => Dealer wins
# => Group wins: dealer = 1. player = 2

# New hand
# => Dealer's up card: As
# => Player's hand: 9d 5d 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 9d 5d 4s 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: As Qs 
# => Dealer hand total: 21
# => Player hand total: 18
# => Dealer wins
# => Group wins: dealer = 2. player = 2

# New hand
# => Dealer's up card: 2s
# => Player's hand: 7d 3c 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 7d 3c 9h 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 2s 7h 
# => Dealer takes a card: 
# => Dealer's hand: 2s 7h Qc 
# => Dealer hand total: 19
# => Player hand total: 19
# => It's a tie
# => Group wins: dealer = 2. player = 2

# New hand
# => Dealer's up card: Ad
# => Player's hand: 8h 2c 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 8h 2c 4c 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 8h 2c 4c 5c 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Ad 9c 
# => Dealer hand total: 20
# => Player hand total: 19
# => Dealer wins
# => Group wins: dealer = 3. player = 2

# New hand
# => Dealer's up card: 6c
# => Player's hand: 4s 2s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 4s 2s Ac 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 4s 2s Ac 3s 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 6c 3h 
# => Dealer takes a card: 
# => Dealer's hand: 6c 3h 6h 
# => Dealer takes a card: 
# => Dealer's hand: 6c 3h 6h 2c 
# => Dealer hand total: 17
# => Player hand total: 20
# => Player wins
# => Group wins: dealer = 3. player = 3

# New hand
# => Dealer's up card: 8c
# => Player's hand: 4h 6c 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 4h 6c 3s 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 4h 6c 3s 3c 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 4h 6c 3s 3c Ad 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 8c Qs 
# => Dealer hand total: 18
# => Player hand total: 17
# => Dealer wins
# => Group wins: dealer = 4. player = 3

# New hand
# => Dealer's up card: 9h
# => Player's hand: 9s 3s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 9s 3s 4s 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 9s 3s 4s 6h 
# => Player busted (hand total: 22)
# => Dealer wins
# => Group wins: dealer = 5. player = 3
# => Dealer wins the group of hands
# => Play again? ('y' or 'n)
# n
# => Thanks for playing! Good bye!
 