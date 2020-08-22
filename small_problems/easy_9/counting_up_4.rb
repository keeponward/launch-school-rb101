# Counting Up

# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

def sequence(num)
  arr = []
  1.upto(num) { |i| arr << i }
  arr
end

# LS Solution
def sequence(number)
  (1..number).to_a
end

# Further Exploration
def sequence(number)
  number >= 1 ?  (1..number).to_a :  (number..1).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-1) == [-1, 0, 1]
p sequence(0) == [0, 1]

p sequence(5)
p sequence(3)
p sequence(1)
p sequence(-1)
p sequence(0)

