=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: array of sub-arrays containing a string and a number (fruit name and quantity)
-  Output: array with the fruit name repeated the number of times specified by the quantity argument

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- Resulting array should be returned.
- Fruit should be in the same order as they appear in the array argument.
---

**Clarifying Questions:**

1. Will there every be a quantity of zero?
  - No, quantity should not be zero.
2. Should the input array be mutated to create the output array?
  - No, do not mutate the input array.

---

**Mental Model:**

- Transform sub_arrays into sub-arrays of the fruit name element repeated the number of times specified by the quantity.
- Flatten the overall array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

---

Data Structure
--------------

- Use nested arrays

---

Algorithm
---------

- Transform sub_arrays into sub-arrays of the fruit name element repeated the number of times specified by the quantity.
- Flatten the overall array to combine all sub-arrays into one array.

Code
----

=end

def buy_fruit(fruit_quant_arr)
  fruit_quant_arr.map {|fruit, quantity| [fruit] * quantity}.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]