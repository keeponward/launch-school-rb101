# 1000 Lights

# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

ON = 1
OFF = 0

# Further Exploration (e.g. "lights 2, 3, and 5 are now off; 1 and 4 are on.")
def print_intermediate_switches(switches, num_switches)
  on_mult_switches = Array.new
  off_mult_switches = Array.new

  (1..num_switches).each do |switch_nbr|
    if switches[switch_nbr - 1] == ON
      on_mult_switches << switch_nbr
    else
      off_mult_switches << switch_nbr
    end
  end
  if off_mult_switches.empty?
    print "no off switches. "
  else
    print "lights "
    off_mult_switches.each_with_index do |off_light, i|
      if (i < off_mult_switches.size - 2)
        print "#{off_light}, "
      elsif (i < off_mult_switches.size - 1)
          print "#{off_light} "
      else
        print "and #{off_light} are now off; "
      end
    end
  end
  if on_mult_switches.empty?
    puts "no on switches."
  else
    on_mult_switches.each_with_index do |on_light, i|
      if (i < on_mult_switches.size - 2)
        print "#{on_light}, "
      elsif (i < on_mult_switches.size - 1)
          print "#{on_light} "
      else
        puts "and #{on_light} are on."
      end
    end
  end
  puts ""
end

def toggle_lights(num_switches)
  switches = []
  on_switches = []

  # Initialize switches to off (let 0 denote off)
  1.upto(num_switches) do
    switches << OFF
  end

  for multiple in 1..num_switches
    mult_index = multiple - 1
    while mult_index < num_switches
      # Toggle the switch at this index
      switches[mult_index] ^= 1
      # Get next multiple
      mult_index += multiple
    end
    print_intermediate_switches(switches, num_switches)
  end
  # Generate output array of 'on' switches
  (1..num_switches).each do |switch_nbr|
    on_switches << switch_nbr if switches[switch_nbr - 1] == ON
  end
  on_switches
end

# LS Solution
# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights_LS(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end
# (End) LS Solution

p toggle_lights(5) == [1, 4]
# p toggle_lights(10) == [1, 4, 9]
# p toggle_lights(100) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]  # perfect squares

# p toggle_lights(5)
# p toggle_lights(10)
# p toggle_lights(100)


# Output for [1, 4]

# no off switches. 1, 2, 3, 4 and 5 are on.

# lights 2 and 4 are now off; 1, 3 and 5 are on.

# lights 2, 3 and 4 are now off; 1 and 5 are on.

# lights 2 and 3 are now off; 1, 4 and 5 are on.

# lights 2, 3 and 5 are now off; 1 and 4 are on.

# true