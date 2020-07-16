# puts "Teddy is #{rand(20..200)} years old!"

# Further Exploration
def print_random_age_for_given_name()
  print 'Enter your name: '
  name = gets.chomp
  
  name = 'Teddy' if name.empty?

  puts "#{name} is #{rand(20..200)} years old!"
end

print_random_age_for_given_name()
