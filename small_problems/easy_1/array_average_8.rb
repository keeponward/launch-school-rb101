def average(arr)
  total = 0
  arr.each do |elem|
    total += elem
  end

  p total/(arr.count.to_f)  # Further Exploration
  return (total/arr.length)

end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40