# Staggered Caps (Part 2)

# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

def staggered_case_orig(string, evens_are_upcase = true)
  result = ''
  need_upper = evens_are_upcase
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    if char =~ /[a-zA-Z]/
      need_upper = !need_upper
    end
  end
  result
end

# LS Solution
def staggered_case_LS(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end

# Further Exploration
def staggered_case(string, toggle_non_alphas = false)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if (char =~ /[a-z]/i) || toggle_non_alphas
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!', true) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', true) == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', false) == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'

