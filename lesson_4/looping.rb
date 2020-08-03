number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
counter = 0

puts "pets[0].object_id = #{pets[0].object_id}"
puts "pets[1].object_id = #{pets[1].object_id}"
puts "pets[2].object_id = #{pets[2].object_id}"

number_of_pets.each_key {|k| puts k.object_id}

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end

