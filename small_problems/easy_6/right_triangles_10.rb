# Right Triangles
# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

def triangle(num_stars)
  num_stars.times do |i|
    num_preceding_spaces = num_stars - i - 1
    num_stars_line = num_stars - num_preceding_spaces
    print ' ' * num_preceding_spaces
    puts '*' * num_stars_line
  end
end

# LS Solution
def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

# Further Exploration
def triangle(num, right_angle_corner)
  case right_angle_corner
  when 'NW'
    lead_char = '*'
    lead_count = num
    lead_inc = -1

    trail_char = ' '
    trail_count = 0
    trail_inc = 1
  when 'NE'
    lead_char = ' '
    lead_count = 0
    lead_inc = 1

    trail_char = '*'
    trail_count = num
    trail_inc = -1
  when 'SE'
    lead_char = ' '
    lead_count = num - 1
    lead_inc = -1

    trail_char = '*'
    trail_count = 1
    trail_inc = 1

  when 'SW'
    lead_char = '*'
    lead_count = 1
    lead_inc = 1

    trail_char = ' '
    trail_count = num - 1
    trail_inc = -1

  else
    lead_char = '*'
    lead_count = num
    lead_inc = -1

    trail_char = ' '
    trail_count = 0
    trail_inc = +1
end
  

  num.times do |n|
    puts (lead_char * lead_count) + (trail_char * trail_count)
    lead_count += lead_inc
    trail_count += trail_inc
  end
end

triangle(5, 'NW')
triangle(5, 'NE')
triangle(5, 'SE')
triangle(5, 'SW')

triangle(9, 'NW')
triangle(9, 'NE')
triangle(9, 'SE')
triangle(9, 'SW')

