NUM_RANKS = 13
NUM_SUITS = 4
NUM_CARDS_IN_DECK = (NUM_RANKS * NUM_SUITS)

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

  if hand_total > 21
    aces_arr = hand.select { |card| card[:value] == 11 }
    num_aces = aces_arr.size
    while num_aces > 0 && hand_total > 21
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

      busted = hand_total > 21
    end

    break if player_action == 's' || busted
  end
  hand_total
end

def complete_dealers_hand_to_get_total(dealer_hand, deck)
  prompt("Dealer's turn: ")

  display_dealer_hand(dealer_hand)

  hand_total = get_hand_total(dealer_hand)

  while hand_total < 17
    prompt "Dealer takes a card: "
    dealer_hand << deal_card!(deck)

    display_dealer_hand(dealer_hand)

    # Sum up all the dealer cards (and treat aces)
    hand_total = get_hand_total(dealer_hand)
  end
  hand_total
end

loop do
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
  if player_total > 21
    prompt("Player busted (hand total: #{player_total})")
    hand_result = 'Dealer wins'
  else
    # Dealer's turn
    dealer_total = complete_dealers_hand_to_get_total(dealer_hand, deck)

    # Player wins if dealer busted
    if dealer_total > 21
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

  prompt("Play again? ('y' or 'n)")
  answer = gets.chomp
  break if answer.downcase != 'y'
end

prompt("Thanks for playing! Good bye!")
