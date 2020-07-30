require 'date'
require 'time'

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def str_24_hour_format_to_minutes(str_24_hour_format)
  arr = str_24_hour_format.split(':')
  hours = arr[0].to_i
  minutes = arr[1].to_i

  ((hours * MINUTES_PER_HOUR) + minutes) % MINUTES_PER_DAY
 
end

def after_midnight(str_24_hour_format)
  str_24_hour_format_to_minutes(str_24_hour_format)
 end

def before_midnight(str_24_hour_format)
  after_mid = str_24_hour_format_to_minutes(str_24_hour_format)

  before_mid = after_mid > 0 ? MINUTES_PER_DAY - after_mid : after_mid
end

# Provided solution
def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

# Further exploration

def after_midnight(time_str)
  t0 = Time.parse(time_str)
  t0.hour * 60 + t0.min
end

def before_midnight(time_str)
  after_mid = after_midnight(time_str)
  before_mid = after_mid == 0 ? 0 : 1440 - after_mid
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

p after_midnight('00:00')
p before_midnight('00:00')
p after_midnight('12:34')
p before_midnight('12:34')
p after_midnight('24:00')
p before_midnight('24:00')

# t0 = Time.parse("00:00")
# p t0

# t0 += 3600

# p t0.strftime("%H:%M")

# t1 = Time.new(2020, 1, 1)

# t2 = t1 + 3600

# p t1
# p t2
# p t2 - t1

# puts t1.day
# puts t1.month
# puts t1.hour

# puts t2.day
# puts t2.month
# puts t2.hour

# puts date = Date.parse('26th Jul 2020')

# puts time = Time.new

# d = Date.parse('Jan 1 1970')

# p d.strftime('%a %d %b %Y')

# t1 = Time.new(d.year, d.mon, d.mday)
