=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: two arrays, each containing a list of number
-  Output: new aray containing produce of each pair of numbers from input arrays that have the same index

---

**Problem Domain:**
Product means the result of multiplying two numbers.
---

**Implicit Requirements:**
- Arguments contain the same number of elements.
- Must return a new array object.
---

**Clarifying Questions:**

1. Is it possible there could be repeated integers within the array?
  - Yes, repeated integers are possible.

---

**Mental Model:**

Multiply each same indexed element with each other. Append value to a new array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

---

Data Structure
--------------

- Use arrays for iteration and integers for multiplication.

---

Algorithm
---------

- Initialize an empty array called products.
- Iterate the same number of times as the number of array elements
  - Multiple the elements at the current index (same as iteration number) for each array together. Append result to products array.
- Return products array.

Code
----

=end

def multiply_list(arr1, arr2)
  products = []
  arr1.size.times do |index|
    products << (arr1[index] * arr2[index])
  end
  products
end

#Further Exploration

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map {|sub_arr| sub_arr.reduce(:*)}
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]