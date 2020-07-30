# Clean up the words
# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

ALPHABET_CHARS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

# My solution
def char_is_alphabetic(char)
  ALPHABET_CHARS.include?(char)
end

def cleanup(str)
  arr = str.split('')
  # p str
  # p arr
  clean_arr = []
  arr.each do |elem|
    if char_is_alphabetic(elem)
      clean_arr << elem
    elsif clean_arr.last != ' '
      clean_arr << ' '
    end
  end
  clean_arr.join()
end

# LS Solution 1
ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end

# LS Solution 2
def cleanup(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("---what's my +*& line?")
