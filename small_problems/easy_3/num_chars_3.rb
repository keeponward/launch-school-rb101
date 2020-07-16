puts "Please write word or multiple words: "
input_str = gets.chomp

del_str = input_str.delete(" ")
split_str = del_str.split('')

print "input_str = "
p input_str

print "del_str = "
p del_str

print "split_str = "
p split_str

puts "There are #{split_str.length} characters in \"#{input_str}\"."

# 
# Provided solution
# 
# print 'Please write word or multiple words: '
# input = gets.chomp
# number_of_characters = input.delete(' ').size
# puts "There are #{number_of_characters} characters in \"#{input}\"."


