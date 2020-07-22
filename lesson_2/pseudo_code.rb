def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num  # assign to first value
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end

p find_greatest([2, 4, 9, 5, 1])

# For example, write out pseudo-code (both casual and formal) that does the following:

# 1. a method that returns the sum of two integers
# 2. a method that takes an array of strings, and returns a string that is all those strings concatenated together
# 3. a method that takes an array of integers, and returns a new array with every other element

# 1.  - Calculate and return sum of two numbers

# 2.  - Convert a collection of strings into a string that is the             concatenation of all the strings in the original collection

# 3.  - Convert a collection of integers into another collection of integers
#       that consists of every other member of the original collection
   


puts "!!(nil || 5) => #{!!(nil || 5)}"

puts "3 || 4 => #{3 || 4}"

puts "!(3 || 4) => #{!(3 || 4)}"

puts "!(3) => #{!(3)}"
