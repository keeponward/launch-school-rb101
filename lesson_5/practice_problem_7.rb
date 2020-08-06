# Practice Problem 7

# Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p b.object_id == arr[1].object_id       # => true
p b[0].object_id == arr[1][0].object_id # => true

p a   # => 2
p b   # => [3, 8]
p arr # => [4, [3, 8]]
