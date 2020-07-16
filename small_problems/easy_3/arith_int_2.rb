# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

# Example

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

def prompt_user_for_number(prompt_str)
  puts prompt_str
end

prompt_user_for_number ("Enter the first number: ")
int_1 = gets.chomp.to_i
# int_1 = gets.chomp.to_f

puts "Enter the second number: "
int_2 = gets.chomp.to_i
# int_2 = gets.chomp.to_f

puts "#{int_1} + #{int_2} = #{int_1 + int_2}"
puts "#{int_1} - #{int_2} = #{int_1 - int_2}"
puts "#{int_1} * #{int_2} = #{int_1 * int_2}"
if int_2 != 0
  puts "#{int_1} / #{int_2} = #{int_1 / int_2}"
  puts "#{int_1} % #{int_2} = #{int_1 % int_2}"
else
  puts "Division and modulo arithmetic cannot be done with zero denominator"
end
puts "#{int_1} ** #{int_2} = #{int_1 ** int_2}"



