# What is your name? Bob
# Hello Bob.
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

print "What is your name? "

name = gets
name.chomp!

# Provided solution
if name[-1] == '!'
  name.chop!

#  My solution
# if name.end_with?("!")
#   name = name.delete_suffix('!')
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."

end


