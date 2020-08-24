# Rotation (Part 2)

# Write a method that can rotate the last n digits of a number. For example:

def rotate_array(arr)
  arr.map.with_index(1) do |_, i|
    i == arr.size ? arr[0] : arr[i]
  end
end

# This method fails when remainder, second_part, has leading zeroes
# def rotate_rightmost_digits(num, num_digits)
#   divisor = 10 ** num_digits
#   first_part, second_part = num.divmod(divisor)
#   (first_part * divisor) + rotate_integer(second_part)
# end

# LS Solution
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

p rotate_rightmost_digits(735291, 1)
p rotate_rightmost_digits(735291, 2)
p rotate_rightmost_digits(735291, 3)
p rotate_rightmost_digits(735291, 4)
p rotate_rightmost_digits(735291, 5)
p rotate_rightmost_digits(735291, 6)
