# def stringy(num, start_bit = 1)
#   bin_str = ""
#   ctr = 0

#   num.times do
#     bin_str << ((ctr % 2) == 0 ? '1' : '0')
#     ctr += 1
#   end

#   # p bin_str
#   return bin_str
# end

def stringy(num_binary_bits, starting_bit_value = 1)
  binary_output = 0
  curr_bit_value = starting_bit_value
  # p "starting_bit_value = #{starting_bit_value}"

  num_binary_bits.times do
    # p "binary_output (before) = #{binary_output}"
    binary_output = (binary_output << 1) | curr_bit_value
    # p "binary_output (after) = #{binary_output}"

    # Toggle the bit value (to be shifted in next pass)
    curr_bit_value ^= 1
     
  end

  # Convert integer to binary string
  string_output = binary_output.to_s(2)
  
  # p "binary_output = #{binary_output}"
  # p "string_output = #{string_output}"

  # Prepend a '0' if starting bit value was a zero
  string_output.insert(0, '0') if starting_bit_value == 0
  # p "string_output (after possible prepend) = #{string_output}"

  return string_output
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'