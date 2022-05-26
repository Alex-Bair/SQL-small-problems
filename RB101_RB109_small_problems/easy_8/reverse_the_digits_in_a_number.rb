=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: positive integer
-  Output: integer that has digits reversed from the input integer

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- Leading zeros should not be in the return value.
---

**Clarifying Questions:**

1. None, examples clarify requirements.

---

**Mental Model:**

Split input integer into it's separate digits. Reverse the sequence of the digits. Join the digits together and convert to an integer.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1

---

Data Structure
--------------

Use arrays to store and manipulate data.

---

Algorithm
---------
- Split input integer into it's separate digits. 
- Join the digits together and convert to an integer.

Code
----

=end

def reversed_number(num)
  num.digits.join.to_i
end