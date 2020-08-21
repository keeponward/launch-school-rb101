# All Substrings

# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise:

def leading_substrings(str)
  accum_str = ''
  str.split('').map do |ch|
    accum_str += ch
  end
end

def substrings(str)
  out_arr = []
  while str != ''
    out_arr << leading_substrings(str)
    # p out_arr
    str.slice!(0)
  end
  out_arr.flatten
end

# LS Solution
def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

p substrings('abcde')


