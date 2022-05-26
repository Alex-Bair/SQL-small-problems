=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: array of all substrings of input string

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- Array should be ordered by where in the string the substring begins.
- Should use the #leading_substrings method from previous exercise.
---

**Clarifying Questions:**

1. None, example and problem statement make requirements clear.

---

**Mental Model:**

Iterate from 0 to the input string length - 1 (i = iteration number)
  Create leading substrings starting at string index i. Add to accumulation array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

---

Data Structure
--------------

- Use arrays to store substrings.

---

Algorithm
---------
- Initialize empty all_substrings array.
- Iterate from 0 to the input string length - 1 (i = iteration number)
  - Create leading substrings starting at string index i. Add to all_substrings array.
- Return all_substrings array.

Code
----

=end

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(string)
  all_substrings = []
  string.length.times do |index|
    all_substrings += leading_substrings(string[index..-1])
  end
  all_substrings
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]