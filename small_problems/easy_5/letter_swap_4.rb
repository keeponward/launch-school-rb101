
# Letter Swap
# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

def swap(str)
  # puts "Input string = #{str}"
  words_arr = str.split(' ')
  # puts "Words array = #{words_arr}"
  out_arr = []

  out_arr = words_arr.map do |word|
    # puts "word = #{word}"
    arr_chars = word.chars()
    first_char = arr_chars.first
    arr_chars[0] = arr_chars.last
    arr_chars[arr_chars.length - 1] = first_char
    arr_chars.join()
  end
  out_arr.join(' ')
end

# LS solution
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

# Further Exploration

# Doesn't work because internal letters of words having at least 3 characters are lost. And words having only one character result in duplicating the one letter.

def swap_first_last_characters(a, b)
  a, b = b, a
 end

def swap(words)
  result = words.split.map do |word|
    puts "before call to swap:  word = #{word}"
    swapped_word = swap_first_last_characters(word[0], word[-1])
    puts "after call to swap:  swapped_word = #{swapped_word}"
    swapped_word
  end
  result.join(' ')
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

p swap('Oh what a wonderful day it is')
# p swap('Abcde')
# p swap('a')


