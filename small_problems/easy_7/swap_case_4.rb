# Swap Case

# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

def swapcase(str)
  arr = str.chars
  out_arr = arr.map do |ch|
    if ch =~ /[a-z]/
      ch.upcase
    elsif ch =~ /[A-Z]/
      ch.downcase
    else
      ch
    end
  end
  out_arr.join('')
end

# LS Solution
def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

p swapcase('CamelCase')
p swapcase('Tonight on XYZ-TV')
