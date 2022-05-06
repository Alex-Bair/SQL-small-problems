=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: One positive integer.
-  Output: Sum of integer's digits

---

**Problem Domain:**
- Nothing specific.
---

**Implicit Requirements:**
- Input is a single positive integer. Output is a single positive integer.
---

**Clarifying Questions:**

1. Are leading zeros allowed in the input? Assume no.

---

**Mental Model:**

Split the input integer's digits out into separate elements. Sum the separate elements.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs: 496
  -  Output: 19
-  Example 2
  -  Inputs: 123_456_789
  -  Output: 45

---

_Your Test Cases:_

-  Example 3
  -  Inputs: 105
  -  Output: 6

-  Example 4
  -  Inputs: 95
  -  Output:14

---

Data Structure
--------------

Use Integer#digits to break digits into an array. Sum up array's elements.

---

Algorithm
---------
1. Separate input integer's digits into an array.
2. Sum up array's elements.

Code
----

=end

def sum(input_int)
  
  input_int.digits.sum
  
end


puts sum(23)
puts sum(496)
puts sum(123_456_789)
puts sum(105)
puts sum(95)