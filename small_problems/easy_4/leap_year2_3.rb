def greg_leap_year?(year)
  if year % 4 != 0
    leap = false
  elsif year % 400 == 0
    leap = true
  elsif year % 100 == 0
    leap = false
  else
    leap = true
  end
  leap
end

def julian_leap_year?(year)
  year % 4 == 0
end

def leap_year?(year)
  year < 1752 ? julian_leap_year?(year) : greg_leap_year?(year)
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# Scotland, along with England, Ireland and Wales, formally adopted the Gregorian calendar in 1752.