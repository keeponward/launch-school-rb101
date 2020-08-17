require 'pry'

PLAYER = 'Player'
COMPUTER = 'Computer'

NUM_GAMES_PER_SET = 5

COMPUTER_STRATEGY = 'ai_optimal'   # 'random', 'ai_defense_only', 'ai_offense_after_defense', 'ai_offense_before_defense', 'ai_optimal'

WHO_MOVES_FIRST = COMPUTER  # PLAYER, COMPUTER, 'choose'

PLAYER_WINS_INDEX = 0
COMPUTER_WINS_INDEX = 1

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                 [1, 5, 9], [3, 5, 7]] # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def joinor(arr, sep = ', ', conjunc = 'or')
  if arr.size == 0
    out_string = ''
  elsif arr.size == 1
    out_string = arr[0].to_s
  else
    last_elem = arr.pop
    out_string = arr.join(sep)
    out_string << ' ' + conjunc + ' ' + last_elem.to_s
  end
  out_string
end

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  # system 'clear'
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}): "
    # prompt "Choose a square (#{joinor(empty_squares(brd), ', ', 'or')}): "
    # prompt "Choose a square (#{joinor(empty_squares(brd), '; ', 'and')}): "
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def game_ending_square(brd, marker)
  square = nil
  WINNING_LINES.each do |line|
    # puts "line = #{line.inspect}"
    if brd.values_at(*line).count(marker) == 2 && 
      brd.values_at(*line).count(INITIAL_MARKER) == 1
      puts "Game ending line = #{line.inspect}"
      # find square with INITIAL_MARKER
      i = 0
      while (square == nil) && (i < line.size)
        if brd[line[i]] == INITIAL_MARKER 
          square = line[i]
          # puts "Available square found: #{square}"
        end
        i += 1
      end
    end
    # break after 1st game ending square is detected
    break if square
  end
  square
end

def immediate_threat(brd)
  square = game_ending_square(brd, PLAYER_MARKER)
  if square != nil
    puts "Threatening square chosen by computer"
  else
    puts "No immediate threat"
  end
  square
end

def pick_winning_square(brd)
  square = game_ending_square(brd, COMPUTER_MARKER)
  if square != nil
    puts "Winning square chosen by computer"
  else
    puts "No winning square"
  end
  square
end

def computer_places_piece!(brd)
  square = nil
  case COMPUTER_STRATEGY
    when 'random'
    when 'ai_defense_only'
      square = immediate_threat(brd)
    when 'ai_offense_after_defense'
      square = immediate_threat(brd)
      if !square
         square = pick_winning_square(brd)
      end  
    when 'ai_offense_before_defense'
      square = pick_winning_square(brd)
      if !square
        square = immediate_threat(brd)
      end
    when 'ai_optimal'
      # pick the winning move; then, defend; then pick square #5; then pick a random square.
      square = pick_winning_square(brd)
      if !square
        square = immediate_threat(brd)
      end
      if !square && (brd[5] == INITIAL_MARKER)
        puts "Computer chose center square (#5)"
        square = 5
      end
  end

  if square == nil
    square = empty_squares(brd).sample
    puts "Computer randomly chose (available) square"
  end

  brd[square] = COMPUTER_MARKER

  puts "Computer square: #{square}"
end

def place_piece!(brd, curr_player)
  if curr_player == PLAYER
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(curr_player)
  curr_player == PLAYER ? COMPUTER : PLAYER
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      # if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return PLAYER
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      # elf brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
   end
  nil
end

def get_who_moves_first()
  first_move = PLAYER
  case WHO_MOVES_FIRST
  when PLAYER
    first_move = PLAYER
  when COMPUTER
    first_move = COMPUTER
  when 'choose'
    answer = ''
    loop do
      prompt "Who gets first move this set of games? (p (for player) or c (for computer))"
      answer = gets.chomp
      break if answer == 'p' || answer == 'c'
      prompt "Only p or c"
    end
      first_move = (answer == 'p') ? PLAYER : COMPUTER
  else
    first_move = PLAYER   
  end
  first_move
end

puts "Player marker is an #{PLAYER_MARKER}. Computer marker is a #{COMPUTER_MARKER}"
 
loop do   # Play again ?
  num_wins = [0, 0]

  first_move = get_who_moves_first()
  if (first_move == PLAYER) 
    print 'Player '
  else
    print 'Computer '
  end
  puts "acts first this set of games"
  
  loop do # Until someone reaches 5 wins
    
    puts ""
    puts "New game"
    board = initialize_board
    current_player = first_move
     
    loop do
      # display_board(board)

      puts "#{current_player}'s turn"

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    
      display_board(board)

      # binding.pry
    end

    display_board(board)

    # Either someone won or the board is full
    if someone_won?(board)
      winner = detect_winner(board)
      winner_index = (winner == PLAYER) ? PLAYER_WINS_INDEX : COMPUTER_WINS_INDEX
      num_wins[winner_index] += 1
      prompt "#{winner} won!"
    else
      prompt "It's a tie"
    end
    player_append = (num_wins[PLAYER_WINS_INDEX] == 1) ? '.' : 's.'
    computer_append = (num_wins[COMPUTER_WINS_INDEX] == 1) ? '.' : 's.'
    prompt("Player has #{num_wins[PLAYER_WINS_INDEX]} win" + player_append)
    prompt("Computer has #{num_wins[COMPUTER_WINS_INDEX]} win" + computer_append)

    if num_wins[0] >= NUM_GAMES_PER_SET
      puts "Player reached #{NUM_GAMES_PER_SET} wins. Player wins the game."
      break
    elsif num_wins[1] >= NUM_GAMES_PER_SET
      puts "Computer reached #{NUM_GAMES_PER_SET} wins. Computer wins the game."
      break
    end
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
