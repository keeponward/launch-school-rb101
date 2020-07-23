# def leap_year?(year)
#   if year % 4 != 0
#     leap = false
#   elsif year % 400 == 0
#     leap = true
#   elsif year % 100 == 0
#     leap = false
#   else
#     leap = true
#   end
#   leap
# end


# Further exploration 
# Provided solution fails for years that are a multiple of 4 and are not a multiple of 100

# Order of checking: 4, 100, 400
# I don't really like this solution - too many assignments to return value, leap.
def leap_year?(year)
  leap = false
  if year % 4 == 0
    leap = true
    if year % 100 == 0
      leap = false
      if year % 400 == 0
        leap = true
      end
    end
  end
  leap
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

