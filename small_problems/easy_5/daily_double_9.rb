# ddaaiillyy ddoouubbllee
# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

# Using String#chars
def crunch(str)
  arr_chars = str.chars
  dups_collapsed = []
  arr_chars.each do |chr|
    dups_collapsed << chr unless dups_collapsed.last == chr
  end
  dups_collapsed.join()
end

# LS Solution
def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

# Using String#each_char
def crunch(str)
  dups_collapsed = ''
  str.each_char do |chr|
    dups_collapsed << chr unless dups_collapsed.end_with?(chr)
  end
  dups_collapsed
end

# Using regular expressions
def crunch(str)
  str.gsub(/(.)\1+/, '\1')
end


p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

p crunch('ddaaiillyy ddoouubbllee')
p crunch('4444abcabccba')
p crunch('ggggggggggggggg')
p crunch('a')
p crunch('')

# def format_date(original_date)
#   date_regex = /\A(\d\d\d\d)([\-\/])(\d\d)\2(\d\d)\z/
#   original_date.sub(date_regex, '\4.\3.\1')
# end

# p format_date('2016-06-17') # -> '17.06.2016'
# p format_date('2017/05/03') # -> '03.05.2017'
# p format_date('2015/01-31') # -> '2015/01-31' (no change)
 
