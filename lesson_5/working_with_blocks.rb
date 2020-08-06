# Example 7
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

sorted_arr = arr.sort # => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]

p sorted_arr

sort_num_arr = arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]

p sort_num_arr

p arr.object_id == sort_num_arr.object_id         # => false


p arr[0].object_id == sort_num_arr[1].object_id   # => true

# Example 9
# out_arr = [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
#   puts "element1 = #{element1}"
#   each = element1.each do |element2|
#     puts "element2 = #{element2}"
#     part = element2.partition do |element3|
#       puts "element3 = #{element3}"
#       # element3.size > 0
#     end
#     puts "part = #{part}"
#   end
#   # puts "each = #{each}"
# end
# # => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]

# puts "out_arr = #{out_arr}"

# Example 10

map_inc = [[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    p "el = #{el}"
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        p "n = #{n}"
        n + 1
      end
    end
  end
end

p map_inc




