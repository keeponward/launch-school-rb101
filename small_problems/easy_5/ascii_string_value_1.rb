def ascii_value(str)
  sum = 0
  str.each_char { |char| sum += char.ord }
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

p ascii_value('Four score')
p ascii_value('Launch School')
p ascii_value('a')
p ascii_value('')

# Further exploration
p 'a'.ord.chr   # => "a"

p 'bc'.ord.chr # => "b"