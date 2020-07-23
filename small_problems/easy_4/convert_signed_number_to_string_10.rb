# Provided solution
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

# My solution
# def signed_integer_to_string(signed_num)
#   prepend_minus = false
#   prepend_plus = false
  
#   if signed_num < 0
#     signed_num = -signed_num
#     prepend_minus = true
#   elsif signed_num > 0
#     prepend_plus = true
#   end

#   str = integer_to_string(signed_num)

#   if prepend_minus
#     str = str.prepend('-')
#   elsif prepend_plus
#     str = str.prepend('+')  
#   end
#   str
# end

# Provided solution
# def signed_integer_to_string(number)
#   case number <=> 0
#   when -1 then "-#{integer_to_string(-number)}"
#   when +1 then "+#{integer_to_string(number)}"
#   else         integer_to_string(number)
#   end
# end

# Refactored provided solution
def signed_integer_to_string(number)
  prepend_minus = false
  prepend_plus = false
  case number <=> 0
  when -1
    number = -number
    prepend_minus = true
  when +1
    prepend_plus = true
  end

  str = integer_to_string(number)

  if prepend_minus
    str = str.prepend('-')
  elsif prepend_plus
    str = str.prepend('+')  
  end
  str
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

p signed_integer_to_string(4321)
p signed_integer_to_string(-123)
p signed_integer_to_string(0)
