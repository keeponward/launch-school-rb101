# Determine suffix string
def suffix(century)
  tens = century % 100

  # Check for 11, 12, or 13
  if tens >= 11 && tens <= 13
    suf = 'th'
  else
    ones = century % 10
    case ones
    when 1
      suf = 'st'
    when 2
      suf = 'nd'
    when 3
      suf = 'rd'
    else
      suf = 'th'
    end
  end
  suf
end

def century(year)
  cen = ((year - 1) / 100) + 1
  cen.to_s + suffix(cen)
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10_103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11_201) == '113th'

p century(2000)
p century(2001)
p century(1965)
p century(256)
p century(5)
p century(10_103)
p century(1052)
p century(1127)
p century(11_201)
