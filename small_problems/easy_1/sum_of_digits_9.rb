# No use of (while, until, loop, and each)

# def sum(num)
#   puts "(input) num = #{num}"
#   str = num.to_s
#   puts "str = #{str}"
#   arr = str.split('')
#   puts "arr = #{arr}"

#   arr_ints = arr.map do |elem|
#     elem.to_i
#   end
#   puts "arr_ints = #{arr_ints}"

#   return arr_ints.reduce(:+)

# end

# Further Exploration (provided solution)
def sum(number)
  # str = number.to_s  # => "23"
  # puts "str = #{str}"
  # arr_chars = str.chars
  # puts "arr_chars = #{arr_chars}"
  # arr_ints = arr_chars.map(&:to_i)
  # puts "arr_ints = #{arr_ints}"
  # sum = arr_ints.reduce(:+)
  # puts "sum = #{sum}"
  # return sum
  
  # .chars       # => ["2", "3"]
  # .map(&:to_i) # => [2, 3]
  # .reduce(:+)  # => 5

  number.to_s.chars.map(&:to_i).reduce(:+)

end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45


