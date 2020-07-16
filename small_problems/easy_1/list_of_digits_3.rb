# def digit_list(num)
#   # p num
#   # p (num.digits).sort
#   return num.digits
# end

# p digit_list(12345)

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# p digit_list(375290)
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# 
# Solution (brute force)
# 
# def digit_list(number)
#   digits = []
#   puts "input number = #{number}"
#   loop do
#     print "  number (before divide) = "
#     print number
#     number, remainder = number.divmod(10)
#     print "  number (after divide)= "
#     print number
#     print "  remainder = "
#     print remainder
  
#     digits.unshift(remainder)
#     print "  digits = "
#     print digits
#     puts
#     break if number == 0
#   end
#   digits
# end

# 
# Idiomatic Ruby
# 
def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true


