# Fibonacci recursion road map stack mimic
# fib_rec_stack_mimic.rb

# Each element of the stack will be a hash.  The hash elements may vary in number of key/pairs.
# The hash elements have nothing to do with running the program.  They are only used for print out diagnostics.
stack = []

# Returns the last 'caller' on the stack. This return location will be popped when a return occurs
def return_caller(stack)
  stack.last[:caller]
end

def print_actual_params(n, left, right = nil)
  puts ""
  if right == nil
    puts "n = #{n}, left = #{left}"
  else
    puts "n = #{n}, left = #{left}, right = #{right}"
  end
end

def print_stack_element(hash)
  # Convert hash to array only for the purpose of printing it out
  arr_hash = hash.to_a

  print " {"
  arr_hash.each_with_index do |sub_arr, i|
    print "#{sub_arr[0]}: #{sub_arr[1]}"
    print ", " if i != (arr_hash.size - 1)
  end
  puts "}"
end

def display_stack(stack)
  puts ""
  puts "Stack contents:"
  if stack.empty?
    puts "Stack is empty"
  else
    stack.each_with_index do |hash, i|
      print " element #{i}: "
      print_stack_element(hash)
    end
  end
end

def push(stack, hash, display_pushed_item = false)

  stack.push(hash)

  if display_pushed_item
    item_append = hash.length > 1 ? 's' : ''
    puts ""
    puts "Pushed item#{item_append} prior to call from #{hash[:caller]} side."
    print_stack_element(hash)
  end
end

def pop(stack, display_popped_item = false)

  hash = stack.pop

  if display_popped_item
    item_append = hash.length > 1 ? 's' : ''
    puts ""
    puts "Popped item#{item_append} returning from #{hash[:caller]} side call."
    print_stack_element(hash)
  end
  hash
end

def fibonacci(n, stack)
  hash = {}

  puts ""
  if return_caller(stack) == 'initial'
    puts "Top of method. n = #{n}. Called from initial (outside) caller."
  else
    puts "Top of method. n = #{n}. Called (recursively) from the #{return_caller(stack)}."
  end
  if n <= 2
    puts ""
    puts "Returning the constant 1 to the #{return_caller(stack)} caller (#{return_caller(stack)} = 1)."
    return 1
  else
    # return fibonacci(n-2) + fibonacci(n-1)

    hash[:caller] = 'left'
    hash[:n] = n

    push(stack, hash, true)
    
    display_stack(stack)

    left = fibonacci(n-2, stack)
    # puts "Line after left."

    hash = pop(stack, true)
    display_stack(stack)
    print_actual_params(n, left)
    # while hash[:caller] != 'left'
    #   puts "ERROR - return from left"
    # end

    # while hash[:n] != n
    #   puts "ERROR - n"
    # end
 
    hash[:caller] = 'right'
    hash[:n] = n
    hash[:left] = left      # store the variable, left

    push(stack, hash, true)

    display_stack(stack)

    right = fibonacci(n-1, stack)
    # puts "Line after right."

    hash = pop(stack, true)
    display_stack(stack)
    print_actual_params(n, left, right)
    # while hash[:caller] != 'right'
    #   puts "ERROR - return from right"
    # end
  

    # while hash[:left] != left
    #   puts "ERROR - left variable"
    # end

    puts ""
    puts "Returning sum of (left + right) = #{left + right} to the #{return_caller(stack)} caller (#{return_caller(stack)} = #{left + right})."

    return left + right
  end
end

hash = {}
hash[:caller] = 'initial'

push(stack, hash, true)

answer = fibonacci(6, stack)

puts ""
puts "answer = #{answer}"

hash = pop(stack, true)
display_stack(stack)

