def reverse_sentence(str)
  arr = str.split()
  # arr = str.split(' ')
  # puts "arr = #{arr}"
  # return arr
  # puts "arr.reverse = #{arr.reverse}"
  # puts "arr.reverse.join(' ') = #{arr.reverse.join(' ')}"
  
  return arr.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'