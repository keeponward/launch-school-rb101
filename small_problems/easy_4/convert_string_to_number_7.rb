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

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

puts "Further exploration"
# Further exploration
CONV_HEX_CHAR_TO_I = {'0' => 0,
                      '1' => 1,
                      '2' => 2,
                      '3' => 3,
                      '4' => 4,
                      '5' => 5,
                      '6' => 6,
                      '7' => 7,
                      '8' => 8,
                      '9' => 9,
                      'a' => 0xA,
                      'b' => 0xB,
                      'c' => 0xC,
                      'd' => 0xD,
                      'e' => 0xE,
                      'f' => 0xF,
                      'A' => 0xA,
                      'B' => 0xB,
                      'C' => 0xC,
                      'D' => 0xD,
                      'E' => 0xE,
                      'F' => 0xF }

def hexadecimal_to_integer(str)
  arr = str.split('')
  p arr

  multiplier = 1
  sum = 0
  while !arr.empty?
    last_char = arr.pop
    p last_char
    p CONV_HEX_CHAR_TO_I[last_char]
    sum += CONV_HEX_CHAR_TO_I[last_char] * multiplier
    p sum
    multiplier *= 16
  end
  sum
end

p hexadecimal_to_integer('4D9f') == 19871

p hexadecimal_to_integer('4D9f')