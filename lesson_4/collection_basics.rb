arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']

p arr[2, 3]    # => ["c", "d", "e"]
p arr[2, 3][0] # => "c"

arr = [1, 'two', :three, '4']
p arr.slice(3, 1) # => ["4"]
p arr.slice(3..3) # => ["4"]
p arr.slice(3)    # => "4"


country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
# country_capitals = { 'uk' => 'London', 'france' => 'Paris', 'germany' => 'Berlin' }
p country_capitals.keys      # => [:uk, :france, :germany]
p country_capitals.values    # => ["London", "Paris", "Berlin"]
p country_capitals.values[0] # => "London"

p country_capitals[:france]
p country_capitals.values[1]

p country_capitals[:france].object_id
p country_capitals.values[1].object_id

p country_capitals[:france] == country_capitals.values[1]
p country_capitals[:france].object_id == country_capitals.values[1].object_id


# ****************************************************************************

arr = [3, 'd', nil]
arr[2] # => nil
arr[3] # => nil

arr.fetch(2) # => nil
# arr.fetch(3) # => IndexError: index 3 outside of array bounds: -3...3
             #        from (irb):3:in `fetch'
             #        from (irb):3
             #        from /usr/bin/irb:11:in `<main>'

# which method is better to use? #[] or #fetch? 

str = 'abcde'
arr = ['a', 'b', 'c', 'd', 'e']

p str[-2] # => "d"
p arr[-2] # => "d"

str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

# Out of bounds
str[-6] # => nil
arr[-6] # => nil


str = 'Practice'

p "str[2] = #{str[2]}"
p "str[2].object_id = #{str[2].object_id}"

arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]
p arr

p "arr[2] = #{arr[2]}"
p "arr[2].object_id = #{arr[2].object_id}"

p str[2].object_id == arr[2].object_id  # false


hsh = { sky: "blue", grass: "green" }
arr = hsh.to_a # => [[:sky, "blue"], [:grass, "green"]]

p "hsh[:sky].object_id = #{hsh[:sky].object_id}"
p "arr[0][1].object_id = #{arr[0][1].object_id}"

p hsh[:sky].object_id == arr[0][1].object_id # true

arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
hash = arr.to_h

p arr[0][1].object_id
p hash[:name].object_id

p hash[:name].object_id == arr[0][1].object_id






