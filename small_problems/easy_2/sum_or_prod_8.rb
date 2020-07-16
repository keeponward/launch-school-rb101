# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# 
# Recursive (for fun) solution
# 
def gen_sum(value)
  if value == 0
    return 0
  else
    sum = value + gen_sum(value - 1)
  end
end

def gen_product(value)
  if value <= 1
    return 1
  else
    prod = value * gen_product(value - 1)
  end

end

# 
# Provided solution (using .upto())
# 
def compute_sum(number)
  total = 0
  1.upto(number) { |value| total += value }
  total
end

def compute_product(number)
  total = 1
  1.upto(number) { |value| total *= value }
  total
end


# 
# Further Exploration (using inject)
# 
def calc_sum(number)
  range = (1..number)
  out = range.inject(0) { |sum, n| sum + n }
  p out
  out 
end

def calc_product(number)
  range = (1..number)
  out = range.inject(1) { |product, n| product * n }
  p out
  out 
end


print "Please enter an integer greater than 0: "
val = gets.chomp.to_i

print "Enter 's' to compute the sum, 'p' to compute the product: "
func = gets.chomp


if func == 's'
  # sum = gen_sum(val)
  # sum = compute_sum(val)
  sum = calc_sum(val)
  puts "The sum of the integers between 1 and #{val} is #{sum}."
elsif func == 'p'
  # prod = gen_product(val)
  # prod = compute_product(val)
  prod = calc_product(val)
  puts "The product of the integers between 1 and #{val} is #{prod}."
else
  puts "Only 's' or 'p' please"
end
