# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).


def multiply(a, b)
  return a * b
end

def square(a)
  return multiply(a, a)
end

# Further Exploration
def power(b, e)
  exp = 1
  if (e != 0)
    e.times do
      exp = multiply(b, exp)    
    end
  end
  return exp
end

# p square(6)

p " Power = #{power(2, 4)}"