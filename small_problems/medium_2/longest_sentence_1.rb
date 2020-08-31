# require 'open-uri'

# File.open('/Users/andywitek/launchschool/downloads/gutenberg.file', "wb") do |file|
#   file.write open('http://www.gutenberg.org/cache/epub/84/pg84.txt').read
# end


# (Includes Further Exploration parts: preserve punctuation, longest word)
# prints period at end of longest sentence, and finds longest word.

curr_sentence_words = []
longest_sentence_words = []
longest_word = ''

text = File.read('/Users/andywitek/launchschool/downloads/gutenberg.file')

# This regex is intended to split on any of the 3 characters: '.' '!' '?' along with any white spaces that 
# occur immediately following (zero or more). The split can also occur on consecutive white-spaces (1 or more).
# The intention is to create an array of words. 
# The captured characters (. ! ?) are not thrown away.  They appear in the result array.  They will be used to
# determine end of sentence below.  They will also be appended to the last word of every longest sentence candidate.
  words = text.split(/(\.)\s*|(\!)\s*|(\?)\s*|\s+/)

  words.each do |word|
    # If word is a sentence ending character
    if word == '.' || word == '!' || word == '?'
      if curr_sentence_words.size > longest_sentence_words.size
        longest_sentence_words = curr_sentence_words
        # Append this (word) sentence ending character to the last word of the array (if array is non-empty)
        if longest_sentence_words.empty?
          longest_sentence_words << word
        else
          longest_sentence_words.last << word
        end
      end
      # Reset current sentence array (for next sentence)
      curr_sentence_words = []
    else
      curr_sentence_words << word

      if word.length > longest_word.length
        longest_word = word
        # puts "New longest word: #{longest_word}"
      end
    end
  end

puts ""
puts "The longest word: "
puts "#{longest_word}"
puts ""
puts "The longest word has #{longest_word.size} characters"

puts ""
puts "The longest sentence: "
puts "#{longest_sentence_words.join(' ')}"
puts ""
puts "The longest sentence has #{longest_sentence_words.size} words"


# LS Solution
# text = File.read('/Users/andywitek/launchschool/downloads/gutenberg.file')
# sentences = text.split(/\.|\?|!/)
# largest_sentence = sentences.max_by { |sentence| sentence.split.size }
# largest_sentence = largest_sentence.strip
# number_of_words = largest_sentence.split.size

# puts "#{largest_sentence}"
# puts "Containing #{number_of_words} words"


# Further Exploration (paragraphs)
text = File.read('/Users/andywitek/launchschool/downloads/gutenberg.file')

# Regex pattern (below) empirically determined by looking at (p text).  Intention is to split into paragraphs
# on 2 or more consecutive pairs of '\r\n'.
paragraphs = text.split(/(\r\n){2,}/)

longest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
longest_paragraph = longest_paragraph.strip
number_of_words = longest_paragraph.split.size

puts ""
puts "The longest paragraph:"
puts "#{longest_paragraph}"
puts ""
puts "The longest paragraph has #{number_of_words} words"

