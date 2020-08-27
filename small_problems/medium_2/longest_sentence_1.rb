# require 'open-uri'

# File.open('/Users/andywitek/launchschool/downloads/gutenberg.file', "wb") do |file|
#   file.write open('http://www.gutenberg.org/cache/epub/84/pg84.txt').read
# end


# (Includes Further Exploration parts: preserve puncuation, longest word)
# prints period at end of longest sentence, and finds longest word.

num_words_in_longest_sentence = 0
num_words_in_this_sentence = 0

curr_sentence_words = []
longest_sentence_words = []

longest_word = ''

text = File.read('/Users/andywitek/launchschool/downloads/gutenberg.file')

text.split(' ').each do |word| 

  num_words_in_this_sentence += 1
  curr_sentence_words << word

  if word.length > longest_word.length
    longest_word = word
    # puts "New longest word: #{longest_word}"
  end

  if word.match(/[\.\!\?]/)
    if num_words_in_this_sentence > num_words_in_longest_sentence
      num_words_in_longest_sentence = num_words_in_this_sentence
      longest_sentence_words = curr_sentence_words

    end
    # Reset sentence word counter (for next sentence)
    num_words_in_this_sentence = 0
    curr_sentence_words = []
  end
end

puts ""
puts "The longest word: "
puts "#{longest_word}"
puts ""
puts "The longest word has #{longest_word.length} characters"

puts ""
puts "The longest sentence: "
puts "#{longest_sentence_words.join(' ')}"
puts ""
puts "The longest sentence has #{num_words_in_longest_sentence} words"

# puts "The longest sentence size: #{longest_sentence_words.size}"

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

# regex pattern empirically determined by looking at (p text)
paragraphs = text.split(/[\r\n]{4,}/)   

longest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
longest_paragraph = longest_paragraph.strip
number_of_words = longest_paragraph.split.size

puts ""
puts "The longest paragraph:"
puts "#{longest_paragraph}"
puts ""
puts "The longest paragraph has #{number_of_words} words"

