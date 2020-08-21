# Reverse the Digits In a Number

# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

def reversed_number(pos_num)
  ((pos_num.to_s).reverse).to_i
end

# LS Solution
def reversed_number(number)
  string = number.to_s
  reversed_string = string.reverse
  reversed_string.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

p reversed_number(12345)
p reversed_number(12213)
p reversed_number(456)
p reversed_number(12000)
p reversed_number(12003)
p reversed_number(1)


