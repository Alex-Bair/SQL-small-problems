=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: array of integers
-  Output: prints the multiplicative average of integers in input array rounded to three decimal points

---

**Problem Domain:**
- Average is the multiplicative average (multiply all numbers together, divide by count of numbers).
---

**Implicit Requirements:**
- Result should be rounded to three decimal places.
- Array will be non-empty.
- Array will contain integers only (no floats).
---

**Clarifying Questions:**

1. None, examples clarify requirements.

---

**Mental Model:**

- Multiply all numbers together. Divide by the count of numbers. Round to three decimal places, then output to screen.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

---

Data Structure
--------------

- Use input array to store numbers, then use floats to perform calculations. Use strings to output to screen.

---

Algorithm
---------

- Multiply all array integers together.
- Divide result by number of array elements (as a float).
- Round result to three decimal places.
- Output result to screen.

Code
----

=end

def show_multiplicative_average(arr)
  result = arr.reduce(:*) / arr.size.to_f
  puts "The result is #{format("%.3f", result)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

#Further Exploration
#If the #to_f call is removed from the program, we perform integer division, which will lose the decimal places since we round too early.