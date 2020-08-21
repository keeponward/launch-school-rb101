# Staggered Caps (Part 1)

# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

def staggered_case(str)
  arr = str.downcase.chars
  # p arr
  out_arr = []
  arr.each_with_index do |ch, index|
    if index.even?
      out_arr[index] = ch.upcase
    else
      out_arr[index] = ch
    end
  end
  out_arr.join
end

# LS Solution
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

# Further Exploration
def staggered_case(string, evens_are_upcase = true)
  result = ''
  need_upper = evens_are_upcase
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('AL_CAPS') == 'Al_cApS'

p staggered_case('I Love Launch School!')
p staggered_case('ALL_CAPS')
p staggered_case('ignore 77 the 444 numbers')
p staggered_case('AL_CAPS')

p staggered_case('AL_CAPS', false)

