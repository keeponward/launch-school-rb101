# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

# num = 1

# while num <= 99 
#   puts num
#   num += 2
# end

# Further Exploration
arr = Array (0...100)

arr_odd = arr.select {|num| num.odd?} 
# arr_odd = arr.select {|num| (num % 2) != 0 } 

arr_odd.each {|e| puts e}
