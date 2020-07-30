# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

def merge(arr1, arr2)
  merged_arr = []
  # p arr1
  # p arr2
  arr1.each {|e| merged_arr << e}
  arr2.each {|e| merged_arr << e}
  merged_arr.uniq!
  merged_arr.sort!
  merged_arr
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
