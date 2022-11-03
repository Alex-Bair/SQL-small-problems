=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: single positive integer n
-  Output: integer representing the difference between:
    - square of the sum of the first n positive integers
    - sum of the squares of the first n positive integers

---

**Problem Domain:**

SQUARE (SUM (1 to n)) - SUM ((1**2, 2**2, 3**2, ... n**2))

---

**Explicit Requirements:**
- Return an integer
---


**Implicit Requirements:**
- Method should be named #sum_square_difference
---

**Clarifying Questions:**

1. Can I assume the input will always be a positive integer greater than 1?
  Yes.

---

**Mental Model:**

Create a range from 1 to n.

Sum the integers from 1 to n. Square the sum. Assign to variable 'square_of_sums'.

Square the integers from 1 to n. Sum the squares. Assign to variable 'sum_of_squares'.

Return 'square_of_sums' - 'sum_of_squares'

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

---

Data Structure
--------------
Nothing complex.
---

Algorithm
---------

Code
----

=end

def sum_square_difference(int)
  range = (1..int)
  square_of_sums = (range.to_a.sum) ** 2
  sum_of_squares = range.reduce(0) do |sum, num|
                                  sum += (num**2)
                                end
  
  square_of_sums - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150