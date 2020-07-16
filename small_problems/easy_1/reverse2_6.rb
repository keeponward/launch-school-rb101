def reverse_words(str)
  arr = str.split

  rev_array = []
  
  arr.each do |word|
    # if word.length >= 5
    #   rev_array.push(word.reverse!)
    # else
    #   rev_array.push(word)
    # end
    word.reverse! if word.length >= 5
    rev_array << word
  end

  return rev_array.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

