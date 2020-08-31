# HEY YOU!

# String#upcase! is a destructive method, so why does this code print HEY you instead of HEY YOU? Modify the code so that it produces the expected output.

# Original (buggy) version
def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

def shout_out_to(name)
  arr_chars = name.chars

  out_arr = arr_chars.map do |c|
    c.upcase
  end
  # arr_chars.each do |c|
  #   c.upcase!
  # end
  # puts 'HEY ' + arr_chars.join('')

  puts 'HEY ' + out_arr.join('')
end

# LS Solution
def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

# LS Solution 2
def shout_out_to(name)
  puts 'HEY ' + name.upcase
end


shout_out_to('you') # expected: 'HEY YOU'
