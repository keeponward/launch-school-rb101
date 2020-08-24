# Rotation (Part 3)

# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

# Fixed the consecutive zero edge case by working with array of chars, bypassing the rotate_rightmost_digits() method.  Also didn't use the method, rotate_array().
def max_rotation(num)
  arr_num = num.to_s.chars
  num_digits = arr_num.size
  num_digits.downto(2) do |num_rotated_digits|
     arr_num[-num_rotated_digits..-1] = arr_num[(1-num_rotated_digits)..-1] + 
                                        [arr_num[-num_rotated_digits]]
  end
  arr_num.join.to_i
end

# LS Solution
# def max_rotation(number)
#   number_digits = number.to_s.size
#   number_digits.downto(2) do |n|
#     number = rotate_rightmost_digits(number, n)
#   end
#   number
# end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# 20001   0
# 00012   1
# 00120   2
# 00201   3
# 00210   4

p max_rotation(20001) == 210

p max_rotation(735291)
p max_rotation(3)
p max_rotation(35)
p max_rotation(105)
p max_rotation(8_703_529_146)

p max_rotation(20001)


