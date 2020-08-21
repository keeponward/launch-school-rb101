# Double Char (Part 1)

# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(str)
  (str.split('').map do |ch|
    ch + ch
  end).join
end

# LS Solution
def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

p repeater('Hello')
p repeater("Good job!")
p repeater('')



