# def running_total(arr)
#   total = 0
#   arr.map do |elem|
#     total += elem
#   end
# end

# Further exploration
def running_total(arr)
  arr.each_with_object([]) do |elem, total|
    total <<= total.empty? ? elem : total.last + elem
    # total = total.empty? ? total << elem : total << total.last + elem
  end
end


p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3])
p running_total([])