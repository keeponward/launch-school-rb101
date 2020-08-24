# Stack Machine Interpretation

# A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.

# A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. Operations that require two values pop the topmost item from the stack (that is, the operation removes the most recently pushed value from the stack), perform the operation using the popped value and the register value, and then store the result back in the register.

# Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and then stores the result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, then the stack is transformed to 3, and the register is left with the value 168.

# Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

# You should initialize the register to 0.

POP_TOKENS = ['POP', 'ADD', 'SUB', 'MULT', 'DIV', 'MOD']

def minilang(cmd_str)
  stack = []
  register = 0
  error = nil

  cmd_arr = cmd_str.split(' ')
  cmd_arr.each do |cmd|
    if stack.empty? && POP_TOKENS.include?(cmd)
      error = "Stack is empty. Cannot perform any pop operation."
      break   # break out of #each loop
    end
    case cmd
    when 'PRINT'
      puts register
    when 'PUSH'
      stack.push(register)
    when 'POP'
      register = stack.pop
    when 'ADD'
      register += stack.pop
    when 'SUB'
      register -= stack.pop
    when 'MULT'
      register *= stack.pop
    when 'DIV'
      register /= stack.pop
    when 'MOD'
      register %= stack.pop 
    else
      cmd_int = Integer(cmd) rescue false 
      if cmd_int 
        register = cmd_int
      else
        error = "Invalid command (token)"
        break    # break out of #each loop
      end
    end
  end
  error
end

# LS Solution
def minilang_LS(program)
  stack = []
  register = 0
  program.split.each do |token|
    case token
    when 'ADD'   then register += stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'SUB'   then register -= stack.pop
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = token.to_i
    end
  end
end



minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Further Exploration
# (3 + (4 * 5) - 7) / (5 % 3)
p minilang('3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PRINT')
# 3     r = 3, s = []
# PUSH  s = [3], r = 3
# 5     r = 5, s = [3]
# MOD   r = 5 % 3 = 2, s = []
# PUSH  s = [2], r = 2    denominator
# 7     r = 5
# PUSH  s = [2, 7]
# 5     r = 5
# PUSH  s = [2, 7, 5] r = 5
# 4     r = 4, s = [2, 7, 5]
# MULT  r = 4*5 = 20, s = [2, 7] 
# PUSH  s = [2, 7, 20], r = 20
# 3     r = 3, s = [2, 7, 20]
# ADD   r = 3+20 = 23, s = [2, 7]
# SUB   r = 23 - 7 = 16, s = [2]
# DIV   r = 16/2 = 8, s = []

# 8

# nil

# Error producing programs
p minilang('POP 5 POP')
p minilang('RUN')

