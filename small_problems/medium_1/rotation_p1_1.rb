# Rotation (Part 1)
# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(arr)
  arr.map.with_index(1) do |_, i|
    i == arr.size ? arr[0] : arr[i]
  end
end

# LS Solution
def rotate_array(array)
  array[1..-1] + [array[0]]
end

# Further Exploration (String)
def rotate_string(str)
  arr = str.split('')
  rotated_arr = rotate_array(arr)
  rotated_arr.join
end

# Further Exploration (Integer)
def rotate_integer(int)
  arr = int.to_s.split('')
  rotated_arr = rotate_array(arr)
  rotated_arr.join.to_i
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p rotate_array([7, 3, 5, 2, 9, 1])
p rotate_array(['a', 'b', 'c'])
p rotate_array(['a'])

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
p x

p rotate_string('abcde') == 'bcdea'
p rotate_string('abcde')

p rotate_integer(12345) == 23451
p rotate_integer(12345)



