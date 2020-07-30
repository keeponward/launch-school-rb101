require 'date'

def time_of_day(minutes)
  hours = (minutes/60) % 24
  rem_minutes = minutes % 60

  "#{'%02d' % hours.to_s}:#{'%02d' % rem_minutes.to_s}" 
end

# Provided solution
SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

# Further exploration (using Date and Time classes)
def time_of_day(delta_minutes)
  date = Date.parse('26th Jul 2020')
  time = Time.new(date.year, date.mon, date.mday)
  time += (SECONDS_PER_MINUTE * delta_minutes)
  time.strftime("%A %H:%M")
end

# def time_test
#   # p Time.at(31_536_000)

#   p Time.new(2020, 7, 18)
# end

# def date_test
#   d = Date.parse('26th Jul 2020')
#                          #=> #<Date: 2001-02-03 ...>
#   p d.year                       #=> 2001
#   p d.mon                        #=> 2
#   p d.mday                       #=> 3
#   p d.wday                       #=> 6
#   # d += 1                       #=> #<Date: 2001-02-04 ...>
#   p d.strftime('%a %d %b %Y')    #=> "Sun 04 Feb 2001"
#   p d.strftime("%A")

#   p Time.new(d.year, d.mon, d.mday)
# end

# p "Mod test"
# p -4231 / 1440
# p -4231 % 1440

# p 4231 / 1440
# p 4231 % 1440

# mod(a, n) = a - n * floor(a / n)

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

p time_of_day(0)
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800)
p time_of_day(-4231)