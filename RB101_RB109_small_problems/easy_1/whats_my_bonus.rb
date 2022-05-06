=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: One positive integer and one boolean
-  Output: If boolean is true, half of input integer. If boolean is false, zero.

---

**Problem Domain:**
- Bonus may be ambiguous, but the problem defines what the bonus should be for each use case.
---

**Implicit Requirements:**
- Output should be numeric.
---

**Clarifying Questions:**

1. Should the output be an integer (i.e. no decimal points?). Assume yes, only integers.
2. Should a message be output (ex: "Your bonus is $XXX"). No, examples do nothave messages.

---

**Mental Model:**

Depending on input boolean, either divide input integer by 2 or return 0.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs: 2800, true
  -  Output: 1400
-  Example 2
  -  Inputs: 1000, false
  -  Output: 0

-  Example 3
  -  Inputs: 50000, true
  -  Output: 25000

---

Data Structure
--------------

Use integer math operators to perform division. Use if-else statement to control logic flow.

---

Algorithm
---------
1. Determine status of boolean.
  1.a If true, divide input integer by 2.
  1.b. If false, return 0.
  
Code
----

=end

def calculate_bonus(int, bool)
  
  bool ? (int / 2) : 0
  
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000