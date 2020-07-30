# Bannerizer
# Write a method that will take a short line of text, and print it within a box.

def print_in_box(message)
  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end

# Further exploration

MAX_LINE_WIDTH = 80
MIN_BOX_WIDTH = 4
MAX_MESSAGE_WIDTH = (MAX_LINE_WIDTH - MIN_BOX_WIDTH)

def print_in_box(message)
  if message.size > MAX_MESSAGE_WIDTH
    p "Trimming"
    message = message.slice(0, MAX_MESSAGE_WIDTH)
  end
  
  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end

# (Extra) Further exploration - line wrap

def print_in_box(message)
  arr_of_strings = []
  rem_chars = message.size

  curr_size = (message.size > MAX_MESSAGE_WIDTH) ? MAX_MESSAGE_WIDTH : message.size

  i = 0
  while rem_chars > 0
    arr_of_strings[i] = message.slice(MAX_MESSAGE_WIDTH * i, curr_size)
    rem_chars -= curr_size
    curr_size = (rem_chars > MAX_MESSAGE_WIDTH) ? MAX_MESSAGE_WIDTH : rem_chars
    i += 1
  end

  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
 
  arr_of_strings.each do |line_string|
    puts "| #{line_string} |"
  end

  puts empty_line
  puts horizontal_rule
end


print_in_box('W' * 154)
print_in_box('W' * 77)

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+


print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

