# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []

# def oddities(arr)
#   out_arr = []
#   arr.each_with_index do |item, index|
#     out_arr << item if index.even?
#     end
#   out_arr
# end

# Provided solution
def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

def evenities(array)
  odd_elements = []
  index = 1
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6])
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])

p evenities([2, 3, 4, 5, 6])
p evenities([1, 2, 3, 4, 5, 6])
p evenities(['abc', 'def'])
p evenities([123])
p evenities([])

