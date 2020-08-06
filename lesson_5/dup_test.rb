# d = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
#   incremented_hash = {}
#   p "arr = #{arr}"
#   hsh.each do |key, value|
#     incremented_hash[key] = value + 1
#   end
#   p "incremented_hash = #{incremented_hash}"
#   arr << incremented_hash
# end

# p d

arr1 = ["a", "b", "c"]
puts "arr1 = #{arr1}  arr1[0] = #{arr1[0]}  arr1[1] = #{arr1[1]}  arr1[2] = #{arr1[2]}"
puts "arr1.object_id = #{arr1.object_id}  arr1[0].object_id = #{arr1[0].object_id}  arr1[1].object_id = #{arr1[1].object_id}  arr1[2].object_id = #{arr1[2].object_id}"
arr2 = arr1.dup
puts "arr2 = #{arr2}  arr2[0] = #{arr2[0]}  arr2[1] = #{arr2[1]}  arr2[2] = #{arr2[2]}"
puts "arr2.object_id = #{arr2.object_id}  arr2[0].object_id = #{arr2[0].object_id}  arr2[1].object_id = #{arr2[1].object_id}  arr2[2].object_id = #{arr2[2].object_id}"

p ""
arr3 = ["a", "b", "c"]
puts "arr3 = #{arr3}  arr3[0] = #{arr3[0]}  arr3[1] = #{arr3[1]}  arr3[2] = #{arr3[2]}"
puts "arr3.object_id = #{arr3.object_id}  arr3[0].object_id = #{arr3[0].object_id}  arr3[1].object_id = #{arr3[1].object_id}  arr3[2].object_id = #{arr3[2].object_id}"
# arr4 = arr3.dup
arr4 = arr3
puts "arr4 = #{arr4}  arr4[0] = #{arr4[0]}  arr4[1] = #{arr4[1]}  arr4[2] = #{arr4[2]}"
puts "arr4.object_id = #{arr4.object_id}  arr4[0].object_id = #{arr4[0].object_id}  arr4[1].object_id = #{arr4[1].object_id}  arr4[2].object_id = #{arr4[2].object_id}"

arr2[1].upcase!
arr4[1].upcase!

p arr2 # => ["a", "B", "c"]
p arr1 # => ["a", "B", "c"]

p arr4 # => ["a", "B", "c"]
p arr3 # => ["a", "B", "c"]

var1 = 'abcd'
var2 = var1
var3 = var1.dup
var4 = var1.clone

puts "var1 = #{var1}  var1.object_id = #{var1.object_id}"
puts "var2 = #{var2}  var2.object_id = #{var2.object_id}"
puts "var3 = #{var3}  var3.object_id = #{var3.object_id}"
puts "var4 = #{var4}  var4.object_id = #{var4.object_id}"

def tt(len)
  puts "len = #{len}  len.object_id = #{len.object_id}"
end

var9 = 5
puts "var9 = #{var9}  len.object_id = #{var9.object_id}"

tt(var9)
