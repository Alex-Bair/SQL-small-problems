=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: return integer representing ASCII string value

---

**Problem Domain:**
ASCII string value is summation of the ASCII values for each character in the string.
String#ord can determine the ASCII value of a character.
---

**Implicit Requirements:**
- an empty string should return 0
- capitalization should be maintained during calculations
---

**Clarifying Questions:**

1. None. Examples are clear.

---

**Mental Model:**
Determine ASCII value for each character in the string.
Sum up the ASCII values of each character in string.
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs: 'Four score'
  -  Output: 984
-  Example 2
  -  Inputs: 'Launch School'
  -  Output: 1251
-  Example 3
  -  Inputs: 'a'
  -  Output: 97
-  Example 4
  -  Inputs: ''
  -  Output: 0
---

Data Structure
--------------
Use the input string, an array to capture each character, then iterate through and sum up ASCII value of each character in array.

---

Algorithm
---------

- Split input string into an array. One character per array element.
- Iterate through the array:
  - Determine ASCII value of character, and add that to a rolling sum.
- Return the final sum.

Code
----

=end

def ascii_value(string)
  string.chars.reduce(0) do |sum, char|
    sum + char.ord
  end
end


p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further exploration

# The mystery method should be Integer#char. This only works with single characters, not a longer string. 
# Only the first character in a longer string will be returned since ord only returns the integer for a single character.

char = 'a'
p char.ord.chr == char