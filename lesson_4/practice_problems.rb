# Practice Problems #4

out_hash = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
  p value.object_id
end

p out_hash

p out_hash['a'].object_id
p out_hash['b'].object_id
p out_hash['c'].object_id

# Practice Problems #5
hash = Hash.new(4)
# hash = { a: 'ant', b: 'bear' }
p "********"
p (hash.shift) + 9    # 13

# Practice Problems #6
p ['ant', 'bear', 'caterpillar'].pop.size


