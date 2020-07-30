# Halvsies
# Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

def halvsies(arr)
  arr_1 = []
  arr_2 = []
  out_arr = []
  num_elems_arr_1 = arr.size/2 + (arr.size & 0x01)
  arr.each_with_index do |elem, index|
    index < num_elems_arr_1 ? arr_1 << elem : arr_2 << elem
  end
  out_arr[0] = arr_1
  out_arr[1] = arr_2
  out_arr
end

# LS Solution
def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

p halvsies([1, 2, 3, 4])
p halvsies([1, 5, 2, 4, 3])
p halvsies([5])
p halvsies([])
