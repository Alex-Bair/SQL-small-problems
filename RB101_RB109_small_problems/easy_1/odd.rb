=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: An integer
-  Output: true if odd

---

**Problem Domain:**
- Even and odd determinations, modulo.
---

**Implicit Requirements:**

- Output will be false if even
- Output will be false if zero
- Assume argument given is a valid integer value (no validation checks required)

---

**Clarifying Questions:**

1.
2.
3.

---

**Mental Model:**

Modulo integer by 2. If the remainder is 0, then integer is even & print false. If remainder is not 0, then integer is odd. Print true 

---

Examples / Test Cases / Edge Cases
----------------------------------

- What is 0 modulo 2? Need to return false
 
**Examples:**

-  Example 1
  -  Inputs: -17
  -  Output: true
-  Example 2
  -  Inputs: 0
  -  Output: false

---

_Your Test Cases:_

-  Example 3
  -  Inputs: 2
  -  Output: false

-  Example 4
  -  Inputs: 5
  -  Output: true

---

_Your Edge Cases:_

-  Example 5
  -  Inputs: 0
  -  Output: false

---

Data Structure
--------------

 Define a method that uses % to modulo integer by 2. Check if

---

Algorithm
---------

1. Define a method that performs integer modulo 2.
2. Check if the result is 0. If so, print false. If not, print true.


Code
----

=end

def is_odd?(integer)

  mod = integer.abs % 2
  mod == 0 ? puts(false) : puts(true)
  
end

is_odd?(0)