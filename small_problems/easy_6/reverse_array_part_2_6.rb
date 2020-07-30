
def reverse(arr)
  out_arr = []
  left_index = 0
  right_index = arr.size - 1

  while right_index >= left_index
    out_arr[left_index] = arr[right_index]
    out_arr[right_index] = arr[left_index]
    left_index += 1
    right_index -= 1
  end
  out_arr
end

# LS Solution
def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

# Further exploration - couldn't figure out how to use inject or each_with_object to reverse the order


list = [1,2,3,4]
puts ""
puts "(before call) list   = #{list}    list.object_id   = #{list.object_id}"
result = reverse(list)
puts "(after call)  list   = #{list}    list.object_id   = #{list.object_id}"
puts "(after call)  result = #{result}  result.object_id = #{result.object_id}"
puts "result.object_id = #{result.object_id}"
puts "result.object_id == list.object_id => #{result.object_id == list.object_id}"

list = %w(a b e d c)
puts ""
puts "(before call) list   = #{list}    list.object_id   = #{list.object_id}"
result = reverse(list)
puts "(after call)  list   = #{list}    list.object_id   = #{list.object_id}"
puts "(after call)  result = #{result}  result.object_id = #{result.object_id}"
puts "result.object_id = #{result.object_id}"
puts "result.object_id == list.object_id => #{result.object_id == list.object_id}"

list = ['abc']
puts ""
puts "(before call) list   = #{list}    list.object_id   = #{list.object_id}"
result = reverse(list)
puts "(after call)  list   = #{list}    list.object_id   = #{list.object_id}"
puts "(after call)  result = #{result}  result.object_id = #{result.object_id}"
puts "result.object_id = #{result.object_id}"
puts "result.object_id == list.object_id => #{result.object_id == list.object_id}"

list = []
puts ""
puts "(before call) list   = #{list}    list.object_id   = #{list.object_id}"
result = reverse(list)
puts "(after call)  list   = #{list}    list.object_id   = #{list.object_id}"
puts "(after call)  result = #{result}  result.object_id = #{result.object_id}"
puts "result.object_id = #{result.object_id}"
puts "result.object_id == list.object_id => #{result.object_id == list.object_id}"

list = [1, 3, 2]
puts ""
puts "(before call) list   = #{list}    list.object_id   = #{list.object_id}"
result = reverse(list)
puts "(after call)  list   = #{list}    list.object_id   = #{list.object_id}"
puts "(after call)  result = #{result}  result.object_id = #{result.object_id}"
puts "result.object_id = #{result.object_id}"
puts "result.object_id == list.object_id => #{result.object_id == list.object_id}"



