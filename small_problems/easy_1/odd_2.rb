puts "Using modulus operator"

def is_odd_mod?(int)
  # return (int % 2 != 0) ? true : false
  # (int % 2 != 0) ? true : false
  int % 2 == 1
end
  
puts is_odd_mod?(2)    # => false
puts is_odd_mod?(5)    # => true
puts is_odd_mod?(-17)  # => true
puts is_odd_mod?(-8)   # => false
puts is_odd_mod?(0)    # => false
puts is_odd_mod?(7)    # => true

# 
# Further exploration
# 
puts "Using .remainder method"

def is_odd_rem?(int)
  (int.remainder(2) == 0) ? false : true
end

puts is_odd_rem?(2)    # => false
puts is_odd_rem?(5)    # => true
puts is_odd_rem?(-17)  # => true
puts is_odd_rem?(-8)   # => false
puts is_odd_rem?(0)    # => false
puts is_odd_rem?(7)    # => true

