# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true

def palindrome?(str)
  return (str == str.reverse)
end

def palindrome_arr?(arr)
  return (arr == arr.reverse)
end


p palindrome?('madam')
p palindrome?('Madam')
p palindrome?("madam i'm adam")
p palindrome?('356653')

p "Array"
p palindrome?(['M','a','d','a','m'])

p palindrome?([3,5,6,6,5,3])