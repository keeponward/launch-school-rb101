# Letter Counter (Part 2)
# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

ALPHABET = (('a'..'z').to_a).concat(('A'..'Z').to_a)

def get_alphabet_word_size(word)
  arr = word.chars
  word_length = 0
  arr.each do |chr|
    if ALPHABET.include?(chr)
      word_length += 1
    end
  end
  word_length
end

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    alphabet_word_size = get_alphabet_word_size(word)
    counts[alphabet_word_size] += 1
  end
  counts
end

# LS Solution
def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

p word_sizes('Four score and seven.')
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
p word_sizes("What's up doc?")
p word_sizes('')

# p ALPHABET

