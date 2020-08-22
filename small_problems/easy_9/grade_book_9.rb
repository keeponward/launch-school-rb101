# Grade book

# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'
# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

def get_grade(g1, g2, g3)
  mean = (g1 + g2 + g3)/3

  case
  when (mean >= 90) && (mean <= 100) then 'A'
  when (mean >= 80) && (mean <  90)  then 'B'
  when (mean >= 70) && (mean <  80)  then 'C'
  when (mean >= 60) && (mean <  70)  then 'D'
  when (mean >= 0 ) && (mean <  60)  then 'F'
  else
  end
end

# LS Solution
def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

# Further Exploration
def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3
  
  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  when 0..59   then 'F'
  else              'AA'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(120, 98, 95) == "AA"

p get_grade(95, 90, 93)
p get_grade(50, 50, 95)
p get_grade(120, 98, 95)

