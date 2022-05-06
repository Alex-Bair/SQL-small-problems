=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: One array containing integers
-  Output: Average of all numbers in array.

---

**Problem Domain:**

- Specific definition of average (provided). Use integer division, meaining average will be rounded down to the nearest integer.

---

**Implicit Requirements:**

- Average will be done with integer division.
- Return will be an integer, not a string.

---

**Clarifying Questions:**

None - examples are clear.

---

**Mental Model:**

Calculate integer average of input array elements.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs: [1, 6]
  -  Output: 3
-  Example 2
  -  Inputs: [1, 5, 87, 45, 8, 8]
  -  Output: 25

---

Data Structure
--------------

Use arrays to store data. Iterate over array elements using integer methods to perform average.

---

Algorithm
---------

1. Iterate over input array.
  1.a. Sum together all array elements.
  2.b. Divide sum by array length (same as # of elements).
2. Return result of division.

Code
----

=end

def average(input_array)
  
  input_array.sum / input_array.length
  
end

puts average([1, 6]) == 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Further exploration

def average(input_array)
  input_array.sum.to_f / input_array.length
end

puts average([1, 6])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
