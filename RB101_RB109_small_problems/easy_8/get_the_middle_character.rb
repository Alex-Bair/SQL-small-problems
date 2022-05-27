=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: Non-empty string
-  Output: String of the middle character(s) of the input string argument

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- If the string has an odd length, return exactly one character (middle-most character).
- If the string has an even length, return exactly two characters (characters on both sides of theoretical midpoint).
---

**Clarifying Questions:**

1. None, examples clarify requirements.

---

**Mental Model:**

Determine length of input string.
Determine midpoint of input string (length / 2.0).
  If length is odd, return middle most character.
  If length is even, return the two characters around the theoretical middle.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'

---

Data Structure
--------------

- Use strings for manipulating input and determining output.
- Use floats when determining midpoint.

---

Algorithm
---------

Determine length of input string.
Determine midpoint of input string (length / 2.0).
  If length is odd, return middle most character (index = midpoint rounded down)
  If length is even, return the two characters around the theoretical middle (indices = midpoint - 1 && midpoint)

Code
----

=end

def center_of(string)
  length = string.length
  midpoint_index = length / 2
  if length.even?
    string[midpoint_index - 1, 2]
  else
    string[midpoint_index]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'