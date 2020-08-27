# Lettercase Percentage Ratio

# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

def letter_percentages(str)
  num_chrs = str.length

  lowercase_count = str.count('a-z')
  uppercase_count = str.count('A-Z')
  neither = num_chrs - (lowercase_count + uppercase_count)

  # puts "num_chrs = #{num_chrs}  str = #{str}  lowercase_count = #{lowercase_count}  uppercase_count = #{uppercase_count}   neither = #{neither}" 

  { lowercase: (lowercase_count * 100.0)/num_chrs,
    uppercase: (uppercase_count * 100.0)/num_chrs,
    neither: (neither * 100.0)/num_chrs } 

end

# LS Solution
def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end

# Further Exploration
def letter_percentages(str)
  num_chrs = str.length

  lowercase_count = str.count('a-z')
  uppercase_count = str.count('A-Z')
  neither_count = num_chrs - (lowercase_count + uppercase_count)

  { lowercase: round_percent(lowercase_count, num_chrs),
    uppercase: round_percent(uppercase_count, num_chrs),
    neither: round_percent(neither_count, num_chrs) } 

end

def round_percent(num, den)
  num_round_digits = num == 0 ? 1 : 2
  ((num * 100.0)/den).round(num_round_digits)
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI') == { lowercase: 66.67, uppercase: 33.33, neither: 0.0 }

p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123')
p letter_percentages('abcdefGHI')



