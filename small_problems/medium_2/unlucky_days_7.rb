# Unlucky Days

# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

require 'date'

# Lifted from: https://stackoverflow.com/questions/36391830/how-many-friday-13ths-in-a-year
def friday_13th(year)
  (1..12).count { |month| Date.new(year, month, 13).friday? }
end

# LS Solution
def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

# Further Exploration

NON_LEAP_YEAR_DAYS_IN_MONTHS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

def num_months_with_five_fridays(year)
  num_months_with_five_fridays = 0
  leap_year = Date.leap?(year)
  # puts "leap_year = #{leap_year}"

  (1..12).each do |month|
    month_count = 0

    # puts "month = #{month}"
    num_days = ((month == 2) && leap_year) ? NON_LEAP_YEAR_DAYS_IN_MONTHS[month-1] + 1 : NON_LEAP_YEAR_DAYS_IN_MONTHS[month-1]
    # puts "num_days = #{num_days}"

    (1..num_days).each do |day|
      # puts "day = #{day}"
      month_count += 1 if Date.new(year, month, day).friday?
    end
    num_months_with_five_fridays += 1 if month_count == 5
  end
  num_months_with_five_fridays
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

p num_months_with_five_fridays(2020) == 4
p num_months_with_five_fridays(2019) == 4
p num_months_with_five_fridays(2020)
p num_months_with_five_fridays(2019)






