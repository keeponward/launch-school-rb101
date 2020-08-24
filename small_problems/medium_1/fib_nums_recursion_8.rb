# Fibonacci Numbers (Recursion)

# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

def fibonacci(n)
  if n <= 2
    return 1
  end
    return fibonacci(n-2) + fibonacci(n-1)
end

# LS Tail recursive version
def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci_LS(nth)
  fibonacci_tail(nth, 1, 1)
end

# Further Exploration
# Many recursive calls. Slow and uses lots of stack space.

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765


