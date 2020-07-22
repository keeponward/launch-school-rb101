def prompt(message)
  Kernel.puts("=> #{message}")
end

def prompt_no_newline(message)
  Kernel.print("=> #{message}")
end

def float?(input)
  input.to_f.to_s == input
end

def integer?(input)
  input.to_i.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

# Get from user:
# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration

loan_amount = ''
loop do
  prompt_no_newline("Enter the loan amount: $")
  loan_amount = Kernel.gets().chomp()

  if number?(loan_amount)
    break
  else
    prompt("That's not a valid loan amount.  Please try again.")
  end
end

apr = ''
loop do
  prompt_no_newline("Enter the Annual Percentage Rate (APR expressed in %): ")
  apr = Kernel.gets().chomp()

  if number?(apr)
    break
  else
    prompt("That's not a valid APR.  Please try again.")
  end
end

duration_in_years = ''
loop do
  prompt_no_newline("Enter the loan duration (in years): ")
  duration_in_years = Kernel.gets().chomp()

  if number?(duration_in_years)
    break
  else
    prompt("That's not a valid loan duration.  Please try again.")
  end
end

# prompt_no_newline("Enter the Annual Percentage Rate (APR expressed in %): ")
# apr = gets.chomp.to_f

# prompt_no_newline("Enter the loan duration (in years): ")
# duration_in_years = gets.chomp.to_f

loan_amount = loan_amount.to_f
monthly_interest_rate = (apr.to_f) / (12.0 * 100.0)
duration_in_months = (duration_in_years.to_f * 12)

# puts "load_amount = #{loan_amount}"
# puts "monthly_interest_rate = #{monthly_interest_rate}"
# puts "duration_in_months = #{duration_in_months}"
# puts "den = #{den}"

den = (1 - (1 + monthly_interest_rate)**(-duration_in_months))

monthly_payment = loan_amount * (monthly_interest_rate / den)

prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

puts ""
