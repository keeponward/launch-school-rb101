# Fibonacci Numbers (Procedural)

def fibonacci(n)
  prev1 = 1
  prev2 = 1
  fib_num_nth = 1  # Initialize in case #times loop is not entered (for n = 1, 2)

  (n - 2).times do
    fib_num_nth = prev2 + prev1
    prev2 = prev1
    prev1 = fib_num_nth
  end
  fib_num_nth
end

# LS Solution
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
