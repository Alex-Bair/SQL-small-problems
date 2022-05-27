=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: two integers (first is the count, second is the first number of a sequence)
-  Output: array containing count number of elements, with the first element being the first number of the sequence and the next element being the next multiple of the first number.

---

**Problem Domain:**
Multiples of n are (2 * n), (3 * n), (4 * n), etc.
---

**Implicit Requirements:**
- Count argument will always be a positive integer or 0.
  - If count is 0, then returned array should be empty
- Starting number will always be any integer (including 0).
---

**Clarifying Questions:**

1. None, examples and problem statement are clear.

---

**Mental Model:**

- Create an empty array.
- For count times,
  - Add the starting number times the iteration number to the created array.
- Return the created array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

---

Data Structure
--------------

- Use arrays to store and manipulate data.

---

Algorithm
---------

- Create an empty array.
- For count times,
  - Add the starting number times the iteration number to the created array.
- Return the created array.

Code
----

=end

def sequence(count, start_num)
  multiples = []

  count.times do |i|
    multiple = start_num * (i + 1)
    multiples << multiple
  end

  multiples
end

#Further Exploration

def sequence(count, first)
  (1..count).map { |value| value * first }
end