# Palindromic Substrings

# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

def leading_substrings(str)
  accum_str = ''
  str.split('').map do |ch|
    accum_str += ch
  end
end

# Ignores non-alpha chars (Further Exploration)
def leading_substrings(str)
  accum_str = ''
  an_str = str.gsub(/[^a-zA-Z]/, '')
  # p "str = #{str}"
  # p "an_str = #{an_str}"
  an_str.split('').map do |ch|
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

def palindrome_req(str)
  str == str.reverse && str.size > 1
end


def palindromes(str)
  out_arr = []
  all_substrings = substrings(str)
  # p all_substrings
  all_substrings.each do |sub_str|
    # p sub_str
    out_arr << sub_str if palindrome_req(sub_str)
  end
  out_arr
end

# LS Solution
# def palindromes(string)
#   all_substrings = substrings(string)
#   results = []
#   all_substrings.each do |substring|
#     results << substring if palindrome?(substring)
#   end
#   results
# end

# def palindrome?(string)
#   string == string.reverse && string.size > 1
# end


p palindromes('abcd') == []
p palindromes('ma@#$dam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

p palindromes('abcd')
p palindromes('ma@#$dam')
# p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')





