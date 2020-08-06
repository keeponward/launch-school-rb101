arr = ['10', '11', '9', '7', '8']

num_arr = arr.map do |num_string|
  num_string.to_i
end

sorted_num_arr = num_arr.sort { |a, b| b <=> a }

sorted_string_arr = sorted_num_arr.map do |num|
  num.to_s
end

p sorted_string_arr

# LS Solution
ls_sorted_string_arr = arr.sort do |a, b|
  b.to_i <=> a.to_i
end
# => ["11", "10", "9", "8", "7"]

p ls_sorted_string_arr