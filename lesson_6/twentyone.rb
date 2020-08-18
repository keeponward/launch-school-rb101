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

def gen_shuffled_deck(init_deck)
  copy_init_deck = init_deck.map { |card| card }
  shuffled_deck = []
  remaining_cards = init_deck.size
  num_cards = remaining_cards
  for i in 0..(num_cards - 1)
    random_index = rand(remaining_cards)
    # Copy card to shuffled deck
    shuffled_deck[i] = copy_init_deck[random_index]
    # Delete the card from the copy of initial deck
    copy_init_deck.delete_at(random_index)
    remaining_cards -= 1
  end
  shuffled_deck
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

initial_deck = []

# Initialize deck (once)
initial_deck = init_deck

loop do
  puts ""
  puts "New group of hands"

  num_dealer_wins = 0
  num_player_wins = 0

  loop do
    puts ""
    puts "New hand"

    # Generate new shuffled deck (for each hand)
    deck = gen_shuffled_deck(initial_deck)

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
# => Dealer's up card: Jh
# => Player's hand: Ks Qh 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Jh Jc 
# => Dealer hand total: 20
# => Player hand total: 20
# => It's a tie
# => Group wins: dealer = 0. player = 0

# New hand
# => Dealer's up card: 6s
# => Player's hand: Kd 3h 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 6s Ac 
# => Dealer hand total: 17
# => Player hand total: 13
# => Dealer wins
# => Group wins: dealer = 1. player = 0

# New hand
# => Dealer's up card: Jd
# => Player's hand: 5h 3s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 5h 3s Qc 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Jd Ks 
# => Dealer hand total: 20
# => Player hand total: 18
# => Dealer wins
# => Group wins: dealer = 2. player = 0

# New hand
# => Dealer's up card: 8s
# => Player's hand: 9s Ts 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 8s 2h 
# => Dealer takes a card: 
# => Dealer's hand: 8s 2h 3c 
# => Dealer takes a card: 
# => Dealer's hand: 8s 2h 3c Ks 
# => Dealer busted (hand total: 23)
# => Player wins
# => Group wins: dealer = 2. player = 1

# New hand
# => Dealer's up card: Qc
# => Player's hand: 7c Qs 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Qc 9h 
# => Dealer hand total: 19
# => Player hand total: 17
# => Dealer wins
# => Group wins: dealer = 3. player = 1

# New hand
# => Dealer's up card: 6s
# => Player's hand: 8c 6d 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 6s 3h 
# => Dealer takes a card: 
# => Dealer's hand: 6s 3h Qs 
# => Dealer hand total: 19
# => Player hand total: 14
# => Dealer wins
# => Group wins: dealer = 4. player = 1

# New hand
# => Dealer's up card: Ah
# => Player's hand: 5h Qh 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 5h Qh 6h 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Ah 7d 
# => Dealer hand total: 18
# => Player hand total: 21
# => Player wins
# => Group wins: dealer = 4. player = 2

# New hand
# => Dealer's up card: 2s
# => Player's hand: 8h 9s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 2s Qc 
# => Dealer takes a card: 
# => Dealer's hand: 2s Qc 5h 
# => Dealer hand total: 17
# => Player hand total: 17
# => It's a tie
# => Group wins: dealer = 4. player = 2

# New hand
# => Dealer's up card: Th
# => Player's hand: 7d 3s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 7d 3s Qh 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Th Jc 
# => Dealer hand total: 20
# => Player hand total: 20
# => It's a tie
# => Group wins: dealer = 4. player = 2

# New hand
# => Dealer's up card: 8s
# => Player's hand: Th Jc 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 8s 7s 
# => Dealer takes a card: 
# => Dealer's hand: 8s 7s 8h 
# => Dealer busted (hand total: 23)
# => Player wins
# => Group wins: dealer = 4. player = 3

# New hand
# => Dealer's up card: 7d
# => Player's hand: 5h 6d 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 5h 6d Ts 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 7d Ah 
# => Dealer hand total: 18
# => Player hand total: 21
# => Player wins
# => Group wins: dealer = 4. player = 4

# New hand
# => Dealer's up card: 7c
# => Player's hand: 7d 8s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 7d 8s 4d 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 7c Qs 
# => Dealer hand total: 17
# => Player hand total: 19
# => Player wins
# => Group wins: dealer = 4. player = 5
# => Player wins the group of hands
# => Play again? ('y' or 'n)
# y

# New group of hands

# New hand
# => Dealer's up card: 7d
# => Player's hand: Js Kc 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 7d 4s 
# => Dealer takes a card: 
# => Dealer's hand: 7d 4s 2s 
# => Dealer takes a card: 
# => Dealer's hand: 7d 4s 2s 2h 
# => Dealer takes a card: 
# => Dealer's hand: 7d 4s 2s 2h Qs 
# => Dealer busted (hand total: 25)
# => Player wins
# => Group wins: dealer = 0. player = 1

# New hand
# => Dealer's up card: Js
# => Player's hand: As Th 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Js Qh 
# => Dealer hand total: 20
# => Player hand total: 21
# => Player wins
# => Group wins: dealer = 0. player = 2

# New hand
# => Dealer's up card: 4d
# => Player's hand: 5h 5c 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 5h 5c 7s 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 4d Qh 
# => Dealer takes a card: 
# => Dealer's hand: 4d Qh Jh 
# => Dealer busted (hand total: 24)
# => Player wins
# => Group wins: dealer = 0. player = 3

# New hand
# => Dealer's up card: Qd
# => Player's hand: 5d 6s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 5d 6s 7c 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: Qd 3d 
# => Dealer takes a card: 
# => Dealer's hand: Qd 3d 7d 
# => Dealer hand total: 20
# => Player hand total: 18
# => Dealer wins
# => Group wins: dealer = 1. player = 3

# New hand
# => Dealer's up card: As
# => Player's hand: 4d 8h 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 4d 8h 8c 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: As 4c 
# => Dealer takes a card: 
# => Dealer's hand: As 4c Jc 
# => Dealer takes a card: 
# => Dealer's hand: As 4c Jc Jh 
# => Dealer busted (hand total: 25)
# => Player wins
# => Group wins: dealer = 1. player = 4

# New hand
# => Dealer's up card: 2c
# => Player's hand: 7h 5s 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# h
# => Player's hand: 7h 5s Qs 
# => Player busted (hand total: 22)
# => Dealer wins
# => Group wins: dealer = 2. player = 4

# New hand
# => Dealer's up card: 3s
# => Player's hand: Ah Jd 
# => Player's turn: 
# => Do you want to hit or stay ('h' or 's')?
# s
# => Dealer's turn: 
# => Dealer's hand: 3s Tc 
# => Dealer takes a card: 
# => Dealer's hand: 3s Tc 7h 
# => Dealer hand total: 20
# => Player hand total: 21
# => Player wins
# => Group wins: dealer = 2. player = 5
# => Player wins the group of hands
# => Play again? ('y' or 'n)
# n
# => Thanks for playing! Good bye!
