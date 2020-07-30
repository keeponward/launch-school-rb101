
def reverse!(arr)
  left_index = 0
  right_index = arr.size - 1

  while right_index > left_index
    temp = arr[left_index]
    arr[left_index] = arr[right_index]
    arr[right_index] = temp
    left_index += 1
    right_index -= 1
  end
  arr
end

# LS Solution
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

list = [1,2,3,4]
puts ""
puts "(before call) list = #{list}  list.object_id = #{list.object_id}"
result = reverse!(list)
puts "(after  call) list = #{list}  list.object_id = #{list.object_id}"
puts "result.object_id = #{result.object_id}"
puts "result.object_id == list.object_id => #{result.object_id == list.object_id}"

list = %w(a b e d c)
puts ""
puts "(before call) list = #{list}  list.object_id = #{list.object_id}"
result = reverse!(list)
puts "(after  call) list = #{list}  list.object_id = #{list.object_id}"
puts "result.object_id = #{result.object_id}"
puts "result.object_id == list.object_id => #{result.object_id == list.object_id}"

list = ['abc']
puts ""
puts "(before call) list = #{list}  list.object_id = #{list.object_id}"
result = reverse!(list)
puts "(after  call) list = #{list}  list.object_id = #{list.object_id}"
puts "result.object_id = #{result.object_id}"
puts "result.object_id == list.object_id => #{result.object_id == list.object_id}"

list = []
puts ""
puts "(before call) list = #{list}  list.object_id = #{list.object_id}"
result = reverse!(list)
puts "(after  call) list = #{list}  list.object_id = #{list.object_id}"
puts "result.object_id = #{result.object_id}"
puts "result.object_id == list.object_id => #{result.object_id == list.object_id}"


