# Fibonacci Numbers (Last Digit)

# In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

def fibonacci_last(n)
  fibonacci(n) % 10
end

# LS Solution Part 1
def fibonacci_last(nth)
  fibonacci(nth).to_s[-1].to_i
end

# LS Solution Part 2
def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

# Further Exploration
# For example, the 123,456,789,987,745th Fibonacci number ends in 5.
# Last digit sequence repeats itself every 60 terms
# https://www.geeksforgeeks.org/program-find-last-digit-nth-fibonnaci-number/
#
def fibonacci_last_FE(n)
  fibonacci_last(n % 60)
end

p fibonacci_last(5) == 5          # -> 5  (the 5th Fibonacci number is 5)
p fibonacci_last(15) == 0         # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20) == 5         # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100) == 5        # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001) == 1    # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) == 3  # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) == 4  # -> 4

p fibonacci_last_FE(15) == fibonacci_last(15)
p fibonacci_last_FE(123_456_789_987_745)  # => 5
