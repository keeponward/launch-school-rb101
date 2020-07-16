# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

print "What is the bill? "
bill = gets.chomp.to_f
print "What is the tip percentage? "
tip_percent = gets.chomp.to_f

tip = (bill * (tip_percent/100.00)).round(2)

total = bill.round(2) + tip

# Further Exploration
# puts "The tip is $#{'%.2f' % tip}"
# puts "The total is $#{'%.2f' % total}"
puts "The tip is $#{format("%.2f", tip)}"
puts "The total is $#{format("%.2f", total)}"


