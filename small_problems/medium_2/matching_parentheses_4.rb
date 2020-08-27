# Matching Parentheses?

# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

def balanced?(str)
  balanced = false
  left_count = str.count('(')
  right_count = str.count(')')
  if (left_count == right_count)
    if (left_count == 0) || (str.index('(') < str.index(')') && str.rindex('(') < str.rindex(')'))
      balanced = true
    end
  end
  balanced
end

# LS Solution
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

# Further Exploration
def balanced?(string)
  parens = 0
  curlys = 0
  squares = 0
  singles = 0
  doubles = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    curlys += 1 if char == '{'
    curlys -= 1 if char == '}'
    squares += 1 if char == '['
    squares -= 1 if char == ']'
    singles += 1 if char == "'"
    doubles += 1 if char == '"'
    break if (parens < 0 || curlys < 0 || squares < 0) 
  end

  parens.zero? && curlys.zero? && squares.zero? && singles.even? && doubles.even? 
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

p balanced?('[((What)[] (is this))?]') == true
p balanced?('[((What)[] {(is this))?]') == false
p balanced?('[("(What)[]" "(is this))?]') == false


