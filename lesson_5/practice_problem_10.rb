# Practice Problem 10

# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# Without using #map (misread the problem)
out_arr = []

i = 0
arr.each do | hash |
  elem_hash = Hash.new(0)
  hash.each do | key, value |
    elem_hash[key] = value + 1
  end
  out_arr[i] = elem_hash
  i += 1
end

p out_arr
# p arr


# Using #map

i = 0
out_arr = arr.map do | hash |
  elem_hash = Hash.new(0)
  hash.each do | key, value |
    elem_hash[key] = value + 1
  end
  elem_hash
end

p out_arr
# p arr

# each_with_object solution
out_arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

p out_arr

