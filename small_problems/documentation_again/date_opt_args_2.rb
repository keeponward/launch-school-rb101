require 'date'

puts "Date, Bodine"

puts Date.new                           # everything defaults
puts Date.new(2016)                     # month, mday, start use defaults
puts Date.new(2016, 5)                  # mday, start use defaults
puts Date.new(2016, 5, 13)              # start uses default
puts Date.new(2016, 5, 13, Date::ITALY) # nothing defaults

