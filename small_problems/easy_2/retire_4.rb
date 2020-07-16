# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

print "What is your age? "
age = gets.chomp.to_i
print "At what age would you like to retire? "
retire_age = gets.chomp.to_i

years_to_work = retire_age - age

curr_year = Time.now.year

puts "It's #{curr_year}. You will retire in #{curr_year + years_to_work}"

puts "You have only #{years_to_work} years of work to go!"
