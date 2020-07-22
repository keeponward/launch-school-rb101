array = [1, 2, 3]

p array.map                   # outputs <Enumerator: [1, 2, 3]:map>

p array.map do |num|
  num + 1
end

array = [1, 2, 3]

p(array.map) do |num|
  num + 1                           #  <Enumerator: [1, 2, 3]:map>
end                                 #  => <Enumerator: [1, 2, 3]:map>

p(array.map { |num| num + 1 })      # [2, 3, 4]
       

arr = '0'

p arr.to_f