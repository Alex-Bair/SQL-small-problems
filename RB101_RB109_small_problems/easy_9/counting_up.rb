=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: integer
-  Output: aray of all integers between 1 and the argument

---

**Problem Domain:**
Nothing specific
---

**Implicit Requirements:**
- Array must be in sequence from 1 to the integer argument.
- Assume integer argument will always be valid and greater than 0.
---

**Clarifying Questions:**

1. None, examples and problem statement are clear.

---

**Mental Model:**

Create an array based off the range from 1 to the integer argument.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
---

Data Structure
--------------

Use ranges and arrays.

---

Algorithm
---------

Create an array based off the range from 1 to the integer argument.

Code
----

=end

def sequence(num)
  (1..num).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

#Further Exploration
# #sequence should return an array from the number less than zero to -1.

def sequence(num)
  num > 0 ? (1..num).to_a : (num..-1).to_a
end