# Sum of Sums

# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

def sum_of_sums(arr)
  sum = 0
  prev_sub_sum = 0
  for i in 0..(arr.size - 1)
    this_sub_sum = prev_sub_sum + arr[i]
    sum += this_sub_sum
    prev_sub_sum = this_sub_sum
  end
  sum
end

# LS Solution 1
def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end

# LS Solution 2
def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end

# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35

p sum_of_sums([3, 5, 2]) == 21
p sum_of_sums([1, 5, 7, 3]) == 36
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

p sum_of_sums([3, 5, 2])
p sum_of_sums([1, 5, 7, 3])
p sum_of_sums([4])
p sum_of_sums([1, 2, 3, 4, 5])