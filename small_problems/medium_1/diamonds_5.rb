# Diamonds!

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

OUTLINE_ONLY = true
SPACE = ' '
ASTERISK = '*'

# Further Exploration
def print_asterisk_segment(num_asterisks)
  if OUTLINE_ONLY
    if num_asterisks >= 3
      ASTERISK +  (' ' * (num_asterisks - 2)) + ASTERISK
    else
      ASTERISK
    end
  else
    ASTERISK * num_asterisks
  end
end

def print_whole_line(line_nbr, grid_size)
  center_line = (grid_size + 1)/2
  # Symmetry about center line
  line = (line_nbr <= center_line) ? line_nbr : (2 * center_line - line_nbr)
  num_asterisks = (2 * line) - 1
  num_spaces = (grid_size - num_asterisks)/2
  puts "#{SPACE * num_spaces}#{print_asterisk_segment(num_asterisks)}#{SPACE * num_spaces}"
end

def diamond(grid_size)
  line = 1
  while line <= grid_size
    print_whole_line(line, grid_size)
    line += 1
  end
end

# LS Solution
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond_LS(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

diamond(3)
diamond(5)
diamond(9)
