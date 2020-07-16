# xor?(5.even?, 4.even?) == true
# xor?(5.odd?, 4.odd?) == true
# xor?(5.odd?, 4.even?) == false
# xor?(5.even?, 4.odd?) == false

# def xor?(b1, b2)
#   ((b1 == true) && (b2 == false)) || ((b1 == false) && (b2 == true))
# end

# Provided solution (not sure why !! is needed)
def xor?(value1, value2)
  # p "(value1 && !value2) = #{(value1 && !value2)}"
  # p "(value2 && !value1) = #{(value2 && !value1)}"
  # p ((value1 && !value2) || (value2 && !value1))
  # p !((value1 && !value2) || (value2 && !value1))
  # p !!((value1 && !value2) || (value2 && !value1))
  !!((value1 && !value2) || (value2 && !value1))
end

p xor?(5.even?, 4.even?)
p xor?(5.odd?, 4.odd?)
p xor?(5.odd?, 4.even?)
p xor?(5.even?, 4.odd?)

# Further exploration
# Yes, use xor for changing light existing state (on or off). If either switch toggles then change light state (i.e., if on turn off, if off turn on). For any
# switch toggle, xor the light state with the value 1, which always takes on the value 1 if previously 0, and 0 if previously 1.
# No short-circuit because both operands must always be evaluated

