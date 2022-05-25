=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: integer representing the number of digits of a given fibonacci number (ex: 13 is 2 digits long)
-  Output: integer representing the index of the first fibonnaci number with the number of digits specified by the input (ex: 13 is the 7th fibonacci number, but the first that has 2 digits)

---

**Problem Domain:**
- Fibonacci sequence starts with two 1s, then the next number is the sum of the previous two.
---

**Implicit Requirements:**
- Fibonacci sequence starts with index of 1.
- Must return integer value.
- Argument will always be >= 2.
---

**Clarifying Questions:**

1. None examples make requirements clear.

---

**Mental Model:**

- Initialize first fibonacci number (fib1), second fibonacci number (fib2), current fibonacci number (current_fib) and index of current fibonacci number (index).
- Loop while current fibonacci number length is less than input integer.
  - Add fib1 and fib2 to get current_fib.
  - Increment index by 1.
  - Reassign fib1 as fib2, and fib2 as current_fib.
- Return index.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

---

Data Structure
--------------

Use integers for calculations and iterations.

---

Algorithm
---------

- Initialize first fibonacci number (fib1), second fibonacci number (fib2), current fibonacci number (current_fib) and index of current fibonacci number (index).
- Loop while current fibonacci number length is less than input integer.
  - Add fib1 and fib2 to get current_fib.
  - Increment index by 1.
  - Reassign fib1 as fib2, and fib2 as current_fib.
- Return index.

Code
----

=end

def find_fibonacci_index_by_length(target_length)
  fib1 = 1
  fib2 = 1
  current_fib = 2
  index = 2
  while current_fib.to_s.size < target_length
    current_fib = fib1 + fib2
    index += 1
    fib1, fib2 = fib2, current_fib
  end
  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847