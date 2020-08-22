# Name Swapping

# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

def swap_name(name)
  arr_name = name.split(' ')
  "#{arr_name.last}, #{arr_name.first}"
end

# LS Solution
def swap_name(name)
  name.split(' ').reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
