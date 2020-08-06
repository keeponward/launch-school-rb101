# Practice Problem 8
# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

def vowel(chr)
  'aeiou'.include?(chr)
  # ['a', 'e', 'i', 'o', 'u'].include?(chr)
end

hsh.each do | _, arr_value |
  arr_value.each do | str |
    str.chars.each do | chr |
      if vowel(chr)
        puts chr
      end
    end
  end
end

# LS Solution
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end



