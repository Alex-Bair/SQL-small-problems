"use strict";
/*

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string containing commands seperated by spaces
-  Output: the register value whenever any PRINT commands appear in the input command

---

**Problem Domain:**

A stack and register programming language uses a stack of values. 

Each operation in the language operates on a register (which can be thought of as the current value). The register is not a part of the stack.

An operations that requires two values pops the topmost item from the stack (i.e. the most recently pushed value on the stack), operates on the popped value and the register value, and stores the result back in the register.

---

**Explicit Requirements:**
- The following commands must be allowed:
  - `n` 
    push `n` in the register. Do not modify the stack
  - PUSH
    push the register value onto the stack. leave the value in the register
  - ADD
    pop a valud from the stack, add it to the register value, and store the result in the register
  - SUB
    pop a value from the stack, subtract it from the register value, and store the result in the register
  - MULT
    pop a value from the stack, multiply it by the register value, and store the result in the register
  - DIV
    pop a value from the stack, divide the register value by the popped value, store the *integer* quotient back in the register
  - REMAINDER
    pop a value from the stack, divide the register value by the popped value, store the *integer* remainder back in the register
  - POP
    remove the topmost item from the stack and place it in the register
  - PRINT
    print the register value
- All operations are *integer* operations
- initialize the stack to [] and the register to 0
- All programs supplied to the funciton will be valid programs - do not need to validate input
---


**Implicit Requirements:**
- function must be caleld minilange
---

**Clarifying Questions:**


---

**Mental Model:**

- Initialize the stack and register to [] and 0 respectively.
- Split the input string into an array of commands.
- Iterate through the array of commands.
  - Perform the appropriate operation depending what the current command is.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('4 PUSH PUSH 7 REMAINDER MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)

---

Data Structure
--------------

Use an array to represent the stack.

Use a number to represent the register.

Use an array to contain the different commands in the input string.

---

Algorithm
---------

- Initialize the stack and register to [] and 0 respectively.
- Split the input string into an array of commands.
- Iterate through the array of commands.
  - Perform the appropriate operation depending what the current command is.

Code
----
*/

function minilang(commandStr) {
  function print() {
    console.log(register);
  }
  
  function pop() {
    register = stack.pop();
  }
  
  function push() {
    stack.push(register);
  }
  
  function add() {
    register += stack.pop();
  }
  
  function sub() {
    register -= stack.pop();
  }
  
  function mult() {
    register *= stack.pop();
  }
  
  function div() {
    register = Math.floor(register / stack.pop());
  }
  
  function remainder() {
    register = Math.floor(register % stack.pop());
  }

  function isStackEmpty() {
    return stack.length === 0;
  }

  let stack = [];
  let register = 0;
  const commandsUsingStack = ['ADD', 'SUB', 'MULT', 'DIV', 'REMAINDER', 'POP'];
  const ERROR_MESSAGE = 'Error: the stack is empty.';

  let commands = commandStr.split(' ');

  for (let index = 0; index < commands.length; index += 1) {
    let command = commands[index];

    if (commandsUsingStack.includes(command) && isStackEmpty()) return ERROR_MESSAGE;

    switch (command) {
      case "PUSH":
        push();
        break;
      case "ADD":
        add();
        break;
      case "SUB":
        sub();
        break;
      case "MULT":
        mult();
        break;
      case "DIV":
        div();
        break;
      case "REMAINDER":
        remainder();
        break;
      case "POP":
        pop();
        break;
      case "PRINT":
        print();
        break;
      default:
        register = Number(command);
    }
  }
}

minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('4 PUSH PUSH 7 REMAINDER MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)

console.log(minilang('ADD SUB 6 7 PRINT'));