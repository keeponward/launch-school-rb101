# CONV_CHAR_TO_I = {'0' => 0,
#                   '1' => 1,
#                   '2' => 2,
#                   '3' => 3,
#                   '4' => 4,
#                   '5' => 5,
#                   '6' => 6,
#                   '7' => 7,
#                   '8' => 8,
#                   '9' => 9 }
                  
# def string_to_signed_integer(str)
#   minus_val = false
#   arr = str.split('')
#   if arr[0] == '+'
#      arr.shift
#   elsif arr[0] == '-'
#     arr.shift
#     minus_val = true
#   end

#   multiplier = 1
#   sum = 0
#   while !arr.empty?
#     last_char = arr.pop
#     # p last_char
#     # p CONV_CHAR_TO_I[last_char]
#     sum += CONV_CHAR_TO_I[last_char] * multiplier
#     # p sum
#     multiplier *= 10
#   end
#   sum = minus_val ? -sum : sum
# end

CONV_CHAR_TO_I = {'0' => 0,
                  '1' => 1,
                  '2' => 2,
                  '3' => 3,
                  '4' => 4,
                  '5' => 5,
                  '6' => 6,
                  '7' => 7,
                  '8' => 8,
                  '9' => 9 }
                  
def string_to_integer(str)
  arr = str.split('')

  multiplier = 1
  sum = 0
  while !arr.empty?
    last_char = arr.pop
    # p last_char
    # p CONV_CHAR_TO_I[last_char]
    sum += CONV_CHAR_TO_I[last_char] * multiplier
    # p sum
    multiplier *= 10
  end
  sum
end

# Provided solution
# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   when '+' then string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end

# Refactored provided solution
def string_to_signed_integer(string)
  negate = (string[0] == '-') ? true : false
  start_elem = (negate || (string[0] == '+')) ? 1 : 0
  val = string_to_integer(string[start_elem..-1])
  if negate
    val = -val
  end
  val
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

p string_to_signed_integer('4321')
p string_to_signed_integer('-570')
p string_to_signed_integer('+100')

