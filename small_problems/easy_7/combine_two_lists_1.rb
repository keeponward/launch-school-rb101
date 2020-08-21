# Combine Two Lists

# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

def interleave(arr1, arr2)
  num_elems = arr1.size

  out_arr = []
  index = 0

  for i in (0..num_elems - 1)
    out_arr << arr1[index]
    out_arr << arr2[index]
    index += 1
  end
  out_arr
end

# LS Solution
def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

# Further Exploration
def interleave(arr1, arr2)
  (arr1.zip(arr2)).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
