def spin_me(str)
  p str.object_id
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

p spin_me("hello world").object_id # "olleh dlrow"


# Different object ids => different objects

# LS Rework (using array)
def spin_me(arr)
  arr.each do |word|
    word.reverse!
  end
end

arr = ['hello', 'world']
puts arr.object_id
puts spin_me(arr).object_id

# Same object ids => same objects