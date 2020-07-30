numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
p numbers   # Automatic .inspect

puts numbers.inspect

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')
p advice

numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
p numbers

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
p numbers

# Programmatically determine if 42 lies between 10 and 100.
p (10..100).cover?(42)

famous_words = "seven years ago..."
puts "Four score and " + famous_words
# puts "Four score and " << famous_words
puts famous_words.prepend("Four score and ")

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones
flintstones.flatten!
p flintstones

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones

arr = []
flintstones.each do |key, val|
  if key == "Barney"
    arr << key
    arr << val
  end
end

p arr

# Provided solution
arr = flintstones.assoc("Barney")

p arr


