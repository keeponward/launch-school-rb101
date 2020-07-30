# Question_1

# arr = ['The Flintstones Rock!', ' The Flintstones Rock!', '  The Flintstones Rock!']
# 10.times {arr.each {|elem| puts elem}}

# Provided solution
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# Question_2
puts "the value of 40 + 2 is #{40 + 2}"

# Question_3
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(12)

# Question_4
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element   # mutating
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]  # new assignment to local (method) variable
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Question_7
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  arr = demo_hash.values
  puts "demo_hash['Herman'].object_id = #{demo_hash['Herman'].object_id}"
  puts "demo_hash['Lily'].object_id = #{demo_hash['Lily'].object_id}"
  puts "arr[0].object_id = #{arr[0].object_id}"
  puts "arr[1].object_id = #{arr[1].object_id}"
  arr.each do |family_member|
    puts "(before) family_member.object_id = #{family_member.object_id}"
    puts "(before) family_member['age'].object_id = #{family_member['age'].object_id}"
    puts "(before) family_member['gender'].object_id = #{family_member['gender'].object_id}"
    family_member["age"] += 42
    family_member["gender"] = "other"
    puts "(after) family_member.object_id = #{family_member.object_id}"
    puts "(after) family_member['age'].object_id = #{family_member['age'].object_id}"
    puts "(after) family_member['gender'].object_id = #{family_member['gender'].object_id}"
 end
end

mess_with_demographics(munsters)

p munsters

# Original hash is affected
