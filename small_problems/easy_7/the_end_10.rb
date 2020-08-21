# The End Is Near But Not Here

# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(str)
  str.split(' ')[-2]
end

# LS Solution
def penultimate(words)
  words_array = words.split
  words_array[-2]
end

# Further Exploration
def middle(str)
  out_str = ''
  arr = str.split(' ')
  if arr.size != 0
    out_str = arr[(arr.size - 1)/2]
  end
  out_str
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

p middle('') == ''
p middle('Launch School is great!') == 'School'
p middle('Launch School is great!')
p middle('Launch is great!') == 'is'
p middle('Launch is great!')