=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string representing commands
-  Output:

GOAL: Method that implements a miniature stack-and-register-based programming language with the following commands:

n - Place a value n in the 'register'. Do not modify the stack.
PUSH - Pusht eh register value on to the stack. Leave the value in the register.
ADD - Pops a value from the stack and adds it to the register, storing the result in the register.
SUB - Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT - Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV - Pops a value from the stack and divides it into the register value, storig the integer remainder of the division in the register
POP - Remove the topmost item from the stack and place in register
PRINT - Print the register value

---

**Problem Domain:**
Stack is a list of values that grows and shrinks dynamically.

Stack-and-register programming uses a stack of values. Operations operate on a register (the current value). The register is not a part of the stack.
Operations that require two values pop the topmost item from the tstack, performs the operation using the popped value and the register value, and then stores the result in the register.
---

**Explicit Requirements:**
- All operations are integer operations
- Must include all operations listed beneath GOAL above.
- Assume all programs are correct programs (won't try to do something illegal or not allowed, will not contain unknown tokens).
- Initialize register to [0].
---


**Implicit Requirements:**
- Method should be named #minilang
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

#n
Place value n in the 'register'.

#push
Append the register value to the end of the stack.

#add
Remove value from the stack, add to the register value. Store result in the register.

#subtract
Remove value from the stack, subtract it from the register value. Store result in the register.

#mult
Remove value from stack, multiply it by the register value. Store result in the register.

#div
Remove value from the stack and divide it into the register value. Store the integer result in the register.

#mod
Remove value from the stack and divide it into the register value. Store integer remainder of division in the register.

#pop
Remove topmost value from the stack and place in the register

#print
Print the register value

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

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

---

Data Structure
--------------

A hash will contain the register and stack:

hash = {
  register: 0,
  stack: []
}

register will be a single integer value constantly updated depending on the command

stack will be an array [] containing anything pushed to the stack

Have separate methods for each command.


---

Algorithm
---------

Code
----

=end

def n(num, hash)
  hash[:register] = num.to_i
end

def push(hash)
  hash[:stack] << hash[:register]
end

def add(hash)
  hash[:register] = hash[:stack].pop + hash[:register]
end

def subtract(hash)
  hash[:register] = hash[:register] - hash[:stack].pop
end

def mult(hash)
  hash[:register] = hash[:stack].pop * hash[:register]
end

def div(hash)
  hash[:register] = hash[:register] / hash[:stack].pop
end

def mod(hash)
  hash[:register] = hash[:register] % hash[:stack].pop
end

def pop(hash)
  hash[:register] = hash[:stack].pop
end

def printt(hash)
  puts hash[:register]
end

def execute_command(command, hash)
  case command
  when 'PRINT' then printt(hash)
  when 'MULT' then mult(hash)
  when 'POP' then pop(hash)
  when 'MOD' then mod(hash)
  when 'DIV' then div(hash)
  when 'SUB' then subtract(hash)
  when 'ADD' then add(hash)
  when 'PUSH' then push(hash)
  else n(command, hash)
  end
end

def minilang(commands)
  hash = {
    register: 0,
    stack: []
  }

  commands = commands.split(' ')

  commands.each do |command|
    execute_command(command, hash)
  end
end

#Further Exploration

minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')

#Error handling

STACK_EMPTY_ERROR = "Error: Stack is empty."

def minilang(program)
  stack = []
  register = 0
  program.split.each do |token|
    case token
    when 'ADD'           then !stack.empty? ? (register += stack.pop) : puts(STACK_EMPTY_ERROR)
    when 'DIV'           then !stack.empty? ? (register /= stack.pop) : puts(STACK_EMPTY_ERROR)
    when 'MULT'          then !stack.empty? ? register *= stack.pop : puts(STACK_EMPTY_ERROR)
    when 'MOD'           then !stack.empty? ? register %= stack.pop : puts(STACK_EMPTY_ERROR)
    when 'SUB'           then !stack.empty? ? register -= stack.pop : puts(STACK_EMPTY_ERROR)
    when 'PUSH'          then stack.push(register)
    when 'POP'           then !stack.empty? ? register = stack.pop : puts(STACK_EMPTY_ERROR)
    when 'PRINT'         then puts register
    when token.to_i.to_s then register = token.to_i
    else                      puts "Error: Invalid token detected"
    end
  end
end