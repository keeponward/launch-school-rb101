# Word to Digit

# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

HASH = {'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'}

def word_to_digit(sentence)
  out_arr = sentence.split.map do |word|
    word_no_punc = word.match(/[a-zA-Z]+/).to_s
    if HASH.has_key?(word_no_punc)
      # Output of map block: word with numeral replacement concatenated with punctuation (if present)
      HASH[word_no_punc] + word.match(/[^a-zA-Z]+/).to_s
    else
      # Output of map block: original word (no replacement, carry original punctuation)
      word
    end
  end
  out_arr.join(' ')
end

# Further Exploration
def word_to_digit(sentence)
  out_str = ''
  prev_index_is_converted_numeral = false
  sentence.split.each_with_index do |word, i|
    word_no_punc = word.match(/[a-zA-Z]+/).to_s.downcase
    if HASH.has_key?(word_no_punc)
      # word with numeral replacement concatenated with punctuation (if present)
      word = HASH[word_no_punc] + word.match(/[^a-zA-Z]+/).to_s
      connect_char = (prev_index_is_converted_numeral || i == 0) ? '' : ' '
      prev_index_is_converted_numeral = true
    else
      connect_char = (i == 0) ? '' : ' '
      prev_index_is_converted_numeral = false
    end
    out_str << connect_char + word
  end
  # Get 10 consecutive decimal digits
  phone_digits = out_str.match(/\d{10}/).to_s
  if phone_digits != ''
    # Replace consecutive phone digits with formatted phone number
    out_str.gsub!(phone_digits, "(#{phone_digits[0, 3]}) #{phone_digits[3, 3]}-#{phone_digits[6, 4]}")
  else
    out_str
  end
end

# LS Solution
DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit_LS(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

p word_to_digit_LS('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

p word_to_digit_LS('Please call me at five five five one two three four. Thanks.')

p word_to_digit('Please call me at five Three ZERO EIGHT six seven five three zero nine. Thanks, Bodine.') == 'Please call me at (530) 867-5309. Thanks, Bodine.'

p word_to_digit('Please call me at five Three ZERO EIGHT six seven five three zero nine. Thanks, Bodine.')


# true
# "Please call me at 5 5 5 1 2 3 4. Thanks."
# true
# "Please call me at (530) 867-5309. Thanks, Bodine."