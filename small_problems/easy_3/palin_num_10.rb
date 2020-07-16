
def palindrome?(str)
  return (str == str.reverse)
end

def palindromic_number?(int)
  p int
  palindrome?(int.to_s)
end


p palindromic_number?(34543) # == true
p palindromic_number?(123210) # == false
p palindromic_number?(22) # == true
p palindromic_number?(5) # == true


# It's not a palidrome with leading zeros.  I'm undecided about whether I want a different result than this.  Looks like integers with leading zeros are treated like octal.  E.g., 022 => 18 and 052 => 42.

p "Leading zeros: #{palindromic_number?(022)}" # == false

p 0052    # => 42