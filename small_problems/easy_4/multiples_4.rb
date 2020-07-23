def multisum(num)
  inc_3 = 3
  inc_5 = 5
  curr_val_3 = 0
  curr_val_5 = 0
  curr_val = 0
  sum = 0

  while curr_val <= num
    sum += curr_val

    if (curr_val_3 + inc_3) < (curr_val_5 + inc_5)
      curr_val = curr_val_3 + inc_3
      curr_val_3 = curr_val
    elsif (curr_val_3 + inc_3) > (curr_val_5 + inc_5)
      curr_val = curr_val_5 + inc_5
      curr_val_5 = curr_val
    else # They're equal
      curr_val = curr_val_5 + inc_5
      curr_val_3 = curr_val
      curr_val_5 = curr_val
   end
    # puts "curr_val = #{curr_val} sum = #{sum}"
  end
  sum
end


# Provided solution
def multiple?(number, divisor)
  number % divisor == 0
end

# def multisum(max_value)
#   sum = 0
#   1.upto(max_value) do |number|
#     if multiple?(number, 3) || multiple?(number, 5)
#       sum += number
#     end
#   end
#   sum
# end


# Further exploration
# I like provided solution better
def multisum(max_value)
  arr = []
  1.upto(max_value) do |number|
    if multiple?(number, 3) || multiple?(number, 5)
      arr << number
    end
  end
  arr.reduce { |sum, n| sum + n}
end


p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168


