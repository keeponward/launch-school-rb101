hash = { a: "ant", b: "bear", c: "cat" }

arr_keys = hash.keys

puts "arr_keys[0].object_id = #{arr_keys[0].object_id}"
puts "arr_keys[1].object_id = #{arr_keys[1].object_id}"
puts "arr_keys[2].object_id = #{arr_keys[2].object_id}"

puts "hash[:a].object_id = #{hash[:a].object_id}"
puts "hash[:b].object_id = #{hash[:b].object_id}"
puts "hash[:c].object_id = #{hash[:c].object_id}"

hash.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}.  pair[0].object_id = #{pair[0].object_id}  pair[1].object_id = #{pair[1].object_id}"
end

out_array = [1, 2, 3].each_with_object([99, 88]) do |num, array|
  array << num if num.odd?
end

p out_array


val_arr = { a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
# => ["ant", "bear", "cat"]

p val_arr

p "********"
in_hash = { a: "ant", b: "bear", c: "cat" }
p in_hash

out_hash = in_hash.each_with_object({}) do |(key, value), hash|
  hash[value] = key
  # p hash.to_a
end

p out_hash

in_hash_array = in_hash.to_a
out_hash_array = out_hash.to_a

p in_hash_array
p out_hash_array

# in_hash_array.each_with_index do |e|
#   p e
# end

p in_hash_array[0][1]
p out_hash_array[0][0]

p in_hash_array[0][1].object_id == out_hash_array[0][0].object_id  # false

# p "in_hash[:a].object_id = #{in_hash[:a].object_id}"
# p "out_hash[:a].object_id = #{in_hash[:a].object_id}"

h2 = { a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end

p h2

if "surf"
  puts "here"
else
end
