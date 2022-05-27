=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: integer
-  Output: if integer is a double number (see examples), then output the input integer. Otherwise, output the input integer multiplied by 2

---

**Problem Domain:**

Double number is considered a number with an even number of digits whose left-side digits are exactly the same as its right-side digits.

---

**Implicit Requirements:**

- Integer must be returned.

---

**Clarifying Questions:**

1. Will the input number always be a positive integer?
  - Yes, assume so.

---

**Mental Model:**

Convert input integer to a string.
Determine string length.
  If string length is even and the left of the midpoint is the same as the right of the midpoint, then return the input integer.
  Else, return the input integer times 2.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

---

Data Structure
--------------

- Use integers for math. Use strings to get information about number (length, midpoint).

---

Algorithm
---------

- Convert input integer to string
- Determine string length (length)
- Determine if input is a double number: =>
      - Determine string midpoint (length / 2)
      - Check if string length is even AND if string left side (indices: 0 through midpoint - 1) is the same as the string right side (indices: midpoint through -1 )
- If input is a double number, return input number.
- Else, return input number times two.

Code
----

=end

def double_number?(num)
  num_string = num.to_s
  length = num_string.length
  midpoint = length / 2
  
  length.even? && (num_string[0..midpoint - 1] == num_string[midpoint..-1]) 
end

def twice(num)
  double_number?(num) ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10