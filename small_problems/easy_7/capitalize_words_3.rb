# Capitalize Words

# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

def word_cap(str)
  arr = str.split(' ')
  cap_arr = arr.map { |word| word.capitalize}
  cap_str = cap_arr.join(' ')
end

# LS Solution (succinct)

# &:method_name => do |block_param| 
  # block_param.method_name
# end
# Note: on methods that have no required arguments
def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

# Further Exploration (no #capitalize - 2 solutions)
def my_capitalize_1(word)
  word = word.downcase
  word[0] = word.chr.upcase
  # word
end

def my_capitalize_2(word)
  word = word.downcase
  first_char = word.slice!(0)
  word.prepend(first_char.upcase)
end

def word_cap(str)
  arr = str.split(' ')
  # cap_arr = arr.map { |word| my_capitalize_1(word) }
  cap_arr = arr.map { |word| my_capitalize_2(word) }
  cap_str = cap_arr.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

p word_cap('four score and seven')
p word_cap('the javaScript language')
p word_cap('this is a "quoted" word')


