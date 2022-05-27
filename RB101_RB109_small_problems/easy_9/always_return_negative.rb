=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: number
-  Output: negative of input number (if already negative or zero, just return input)

---

**Problem Domain:**
Nothing specific
---

**Implicit Requirements:**
- Explicit requirements are clear.
---

**Clarifying Questions:**

1. Will the input always be an integer?
  - Yes, assume so.

---

**Mental Model:**

Check if input is positive. If so, return the input multiplied by -1. Else, return the input.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

---

Data Structure
--------------

Use integers for calculations.

---

Algorithm
---------

- Check if input is positive.
  - If true, return input multiplied by -1.
  - Else, return the input unchanged.

Code
----

=end

def negative(num)
  num.positive? ? -num : num
end

#Further Exploration

#Code below is shorter, however is it not preferrable since it is not as intuitive and not immediately understandable what the order of operations is.

def negative(number)
  -number.abs
end