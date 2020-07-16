# Print the even numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

# arr = Array (1..99)
# arr_even = arr.select {|num| num.even?} 
# arr_even.each {|e| puts e}

# More efficiently
num = 2
while num <= 99 
  puts num
  num += 2
end