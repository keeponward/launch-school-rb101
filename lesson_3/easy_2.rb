# Question 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# See if Spot is present
p ages.has_key?("Spot")
p ages.key?("Spot")
p ages.include?("Spot")
p ages.member?("Spot")

p ages.key?("Lily")

# Question 2

munsters_description = "The Munsters are creepy in a good way."

p munsters_description.swapcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase

# Question 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# ages["Marilyn"] = additional_ages["Marilyn"]
# ages["Spot"] = additional_ages["Spot"]

# additional_ages.each do |key, val|
#   ages[key] = val
# end

# Provided solution
ages.merge!(additional_ages)

p ages

# Question 4
# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

# p advice.split(' ').include?('are')

p advice.match?("Dino")

# Question 5
p flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.object_id
flintstones << "Dino"
p flintstones
p flintstones.object_id


# Question 7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Provided solution
p flintstones.object_id
# flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain
flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item
p flintstones.object_id
p flintstones

# Question 8
# ...remove everything starting from "house".
# advice = "Few things in life are as important as house training your pet dinosaur."
# short_string = advice.split('house')[0]
# p short_string

advice = "Few things in life are as important as house training your pet dinosaur."

# new_arr = advice.slice!(0..38)

# Provided solution
# p advice.index('house')
new_arr = advice.slice!(0, advice.index('house'))

p new_arr
p advice

# Question 9
# Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"

# Provided solution
p statement.count('t')

# Question 10
title = "Flintstone Family Members"
p title.index('Flintstone')
centered_title = title.center(40)

p centered_title

p centered_title.index('Flintstone')
p centered_title.length

