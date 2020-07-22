require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'en'

# puts MESSAGES.inspect

# Ask the user for two numbers at the top of file
# Ask the user for an operation to perform
# Perform the operation on the two numbers
# Output the result

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
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

def operation_to_message(op)
  operation = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  operation
end

# Kernel.puts("Welcome to Calculator")
# prompt("Welcome to Calculator. Enter your name: ")
prompt(messages('welcome', LANGUAGE))

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

prompt("Hi #{name}")

number1 = ''
loop do
  prompt(messages('first_number', LANGUAGE))
  number1 = Kernel.gets().chomp()

  # If integer or float
  if number?(number1)
    break
  else
    prompt(messages('valid_number', LANGUAGE))
  end
end

number2 = ''
loop do
  prompt(messages('second_number', LANGUAGE))

  number2 = Kernel.gets().chomp()

   # If integer or float
   if number?(number2)
    break
  else
    prompt(messages('valid_number', LANGUAGE))
  end
end

operator_prompt = <<-MSG
  What operation would you like to perform?
  1) Add
  2) Subtract
  3) Multiply
  4) Divide
  MSG

prompt(operator_prompt)

operator = ''
loop do
  operator = Kernel.gets().chomp()

  if %w(1 2 3 4).include?(operator)
    break
  else
    prompt(messages('operation_choice', LANGUAGE))
  end
end

prompt("#{operation_to_message(operator)} the two numbers...")

result =  case operator
          when '1'
            number1.to_f + number2.to_f
          when '2'
            number1.to_f - number2.to_f
          when '3'
            number1.to_f * number2.to_f
          when '4'
            number1.to_f / number2.to_f
          end

Kernel.puts("The result is #{result}")
