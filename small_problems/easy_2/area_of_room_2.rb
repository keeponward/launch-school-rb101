
print "Enter the length of the room in meters: "
# input = gets
# puts "input = #{input}"
# puts "input.chomp = #{input.chomp}"
# puts "input.chomp.to_i = #{input.chomp.to_i}"
# puts "input.to_f = #{input.to_f}"
# puts "input.chomp.to_f = #{input.chomp.to_f}"
length = gets.chomp.to_f

print "Enter the width of the room in meters: "
width = gets.chomp.to_f


SQUARE_METERS_TO_SQUARE_FEET = 10.7639
area_in_square_meters = length * width
area_in_square_feet = area_in_square_meters * SQUARE_METERS_TO_SQUARE_FEET

puts "The area of the room is #{area_in_square_meters.round(2)} square meters (#{area_in_square_feet.round(2)} square feet)."
