# Getting Things Done

# We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list, but invoking move on line 11 results in a SystemStackError. What does this error mean and why does it happen?

def move(n, from_array, to_array)
  return if n <= 0                # Added line of code to fix recursion bug
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

# Further Exploration
# What happens if the length of the from_array is smaller than n?
# Answer: when #shift is executed on an empty array, nil is returned.  So, for each time that from_array.shift is executed on an empty array, nil will be appended (pushed) on to the to_array.


p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']