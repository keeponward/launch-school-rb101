# Neutralizer

# We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

NEG_ARRAY = %w(dull boring annoying chaotic)

def neutralize(sentence)
  words = sentence.split(' ')
  pos_only_words = words.difference(NEG_ARRAY)

  # words.each do |word|
  #   words.delete(word) if negative?(word)
  # words.join(' ')
  pos_only_words.join(' ')
end

# Alternate solution (idea taken from Further Exploration mutating_reject (below))
def neutralize_alt(sentence)
  words = sentence.split(' ')
  i = 0
  loop do
    break if i == words.length
    if negative?(words[i])
      words.delete_at(i)
    else
      i += 1
    end
  end

  # words.each do |word|
  #   words.delete(word) if negative?(word)
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

# LS Solution
def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

# Further Exploration (LS)
def mutating_reject(&array)
  i = 0
  loop do
    break if i == array.length

    if yield(array[i]) # if array[i] meets the condition checked by the block
      array.delete_at(i)
    else
      i += 1
    end
  end

  array
end

puts neutralize_alt('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.