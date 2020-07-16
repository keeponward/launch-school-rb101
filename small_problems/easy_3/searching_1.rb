# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# Examples

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].


user_array = []

puts "Enter the 1st number: "
user_array[0] = gets.chomp.to_i

puts "Enter the 2nd number: "
user_array[1] = gets.chomp.to_i

puts "Enter the 3rd number: "
user_array[2] = gets.chomp.to_i

puts "Enter the 4th number: "
user_array[3] = gets.chomp.to_i

puts "Enter the 5th number: "
user_array[4] = gets.chomp.to_i

puts "Enter the last number: "
user_last = gets.chomp.to_i

p user_array

if user_array.include?(user_last)
  puts "The number #{user_last} appears in #{user_array}."
else
  puts "The number #{user_last} does not appear in #{user_array}."
end

