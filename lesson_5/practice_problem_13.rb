# Practice Problem 13

# Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# The sorted array should look like this:
[[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# Using #sort
sorted_arr = arr.sort do | a, b |
  a.select { | e | e % 2 != 0 } <=> b.select { | e | e % 2 != 0 }
end

p sorted_arr

# Using #sort_by
sorted_arr = arr.sort_by { | e | e.select { | int | int % 2 != 0 } }

p sorted_arr