# fizzbuzz

# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(start_num, end_num)
  for num in start_num..end_num
    div_by_3 = (num % 3 == 0)
    div_by_5 = (num % 5 == 0)
    div_by_3_and_5 = (div_by_3 && div_by_5)

    if div_by_3_and_5
      puts "FizzBuzz"
    elsif div_by_3
      puts "Fizz"
    elsif div_by_5
      puts "Buzz"
    else
      puts num
    end
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
