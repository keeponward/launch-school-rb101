VALID_CHOICES = %w(r p ss s l)

SHORT_CUTS = {  'r' => 'rock',
                'p' => 'paper',
                'ss' => 'scissors',
                's' => 'spock',
                'l' => 'lizard' }

WIN_RULES = { 'rock' => ['scissors', 'lizard'],
              'paper' => ['rock', 'spock'],
              'scissors' => ['paper', 'lizard'],
              'spock' => ['scissors', 'rock'],
              'lizard' => ['paper', 'spock'] }

WIN_DISPLAY = { 'player_won' => 'You won!',
                'computer_won' => 'Computer won!',
                'tie' => "It's a tie" }

num_wins = {  'player_won' => 0,
              'computer_won' => 0,
              'tie' => 0 }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WIN_RULES[SHORT_CUTS[first]].include?(SHORT_CUTS[second])
end

def get_result(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    'player_won'
  elsif win?(computer_choice, player_choice)
    'computer_won'
  else
    'tie'
  end
end

def display_result(win_result)
  prompt(WIN_DISPLAY[win_result])
end

def update_score(win_result, num_wins)
  num_wins[win_result] += 1
end

def get_match_result(num_wins)
  if num_wins['player_won'] >= 5
    'player_wins_match'
  elsif num_wins['computer_won'] >= 5
    'computer_wins_match'
  else
    'match_continues'
  end
end

loop do
  # Initialize number of wins
  num_wins['player_won'] = 0
  num_wins['computer_won'] = 0
  num_wins['tie'] = 0

  loop do
    player_choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      player_choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(player_choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    # Randomly choose a valid choice for the computer
    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{player_choice} (for #{SHORT_CUTS[player_choice]}).")

    prompt("Computer chose: #{computer_choice} (for #{SHORT_CUTS[computer_choice]}).")

    result = get_result(player_choice, computer_choice)

    display_result(result)

    update_score(result, num_wins)

    match_result = get_match_result(num_wins)

    if match_result == 'player_wins_match'
      puts "Player wins match - Player is the Grand Winner!!!!"
      break
    elsif match_result == 'computer_wins_match'
      puts "Computer wins match - Computer is the Grand Winner!!!!"
      break
    end
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
