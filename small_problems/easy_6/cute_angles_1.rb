DEGREE = "\xC2\xB0"

def dms(degrees)
  whole_degrees = degrees.floor
  minutes = ((degrees - whole_degrees) * MINUTES_PER_DEGREE).round(8)
  whole_minutes = minutes.floor
  seconds = ((minutes - whole_minutes) * SECONDS_PER_MINUTE).round(8)
  whole_seconds = seconds.round

  format(%(#{whole_degrees}#{DEGREE}%02d'%02d"), whole_minutes, whole_seconds)
end

# LS Solution
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

puts dms(30)
puts dms(76.73)
puts dms(254.6)
puts dms(93.034773)
puts dms(0)
puts dms(360)

p dms(400) == %(400°00'00")
p dms(-40) == %(-40°00'00")
p dms(-420) == %(-420°00'00")

puts dms(400)
puts dms(-40)
puts dms(-420)

# Further Exploration

DEGREES_PER_REVOLUTION = 360.0

def dms(degrees)

  degrees = degrees - DEGREES_PER_REVOLUTION * (degrees/DEGREES_PER_REVOLUTION).floor

  whole_degrees = degrees.floor
  minutes = ((degrees - whole_degrees) * MINUTES_PER_DEGREE).round(8)
  whole_minutes = minutes.floor
  seconds = ((minutes - whole_minutes) * SECONDS_PER_MINUTE).round(8)
  whole_seconds = seconds.round

  format(%(#{whole_degrees}#{DEGREE}%02d'%02d"), whole_minutes, whole_seconds)
end

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")

puts dms(400)
puts dms(-40)
puts dms(-420)