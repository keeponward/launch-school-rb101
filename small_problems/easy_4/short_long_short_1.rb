def short_long_short(str1, str2)
  if (str1.length >= str2.length)
    long_str = str1
    short_str = str2
  else
    long_str = str2
    short_str = str1
  end
  return short_str + long_str + short_str
end

  
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

p short_long_short('Sunday', 'Roxy')  # RoxySundayRoxy