# INT_TO_CHAR = { 0 => '0',
#                 1 => '1',
#                 2 => '2',
#                 3 => '3',
#                 4 => '4',
#                 5 => '5',
#                 6 => '6',
#                 7 => '7',
#                 8 => '8',
#                 9 => '9' }

# def integer_to_string(num)
#   arr = []
#   loop do 
#     digit = num % 10
#     num = num / 10
#     arr.unshift(INT_TO_CHAR[digit])
#     break if num == 0
#   end
#   arr.join()
# end

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

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

p integer_to_string(4321)
p integer_to_string(0)
p integer_to_string(5000)