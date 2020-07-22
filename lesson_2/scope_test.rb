# arr = [1, 2, 3]
# for i in arr do
#   a = 5      # a is initialized here
# end
# puts a       # Yes, accessible here

# loop do
#   a = 5
#   if a == 5
#     break
#   end
# end
# puts a       # Error, not accessible here

# def cap(str)
#   str.capitalize!   # does this affect the object outside the method?
# end

# name = "jim"
# cap(name)
# puts name           # => Jim


# def test_method
#   prompt('test message')
# end

# test_method           # second, try invoking "test_method" here

# def prompt(message)
#   Kernel.puts("=> #{message}")
# end

# test_method           # first, try invoking "test_method" here


words = %w(scooby doo on channel two)
words.each {|str| str << '!'}
puts words.inspect        # => ["scooby!", "doo!", "on!", "channel!", "two!"]
puts words              # => scooby!
                        # doo!
                        # on!
                        # channel!
                        # two!
