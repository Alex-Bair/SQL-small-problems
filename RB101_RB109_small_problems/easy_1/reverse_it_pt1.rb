=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: one string
-  Output: string with words in reverse order as input (but letters within words are not reversed)

---

**Problem Domain:**
- Nothing specific.
---

**Implicit Requirements:**
- Capitalization of input must be maintained
- Word sequence should be reversed. 
- Letters within words should NOT be reversed.
- Multiple sequential spaces should be reduced to a single space if between words.
- Multiple sequential spaces without any characters between them should be removed.

---

**Clarifying Questions:**

1. None - provided examples are fairly clear.

---

**Mental Model:**

Split provided string into individual strings. Reverse order of individual strings & combine in printout.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs: "Hello World"
  -  Output: "World Hello"
-  Example 2
  -  Inputs: "Reverse these words"
  -  Output: "words these Reverse"
-  Example 3
  -  Inputs: ""
  -  Output: ""
-  Example 4
  -  Inputs: "     "
  -  Output: ""

---

_Your Test Cases:_

-  Example 3
  -  Inputs: "Hello World   "
  -  Output: "World Hello"

---

Data Structure
--------------

Use arrays to keep track of string order. Reverse string order, then print.

---

Algorithm
---------

1. Split input string delimited by spaces into an array.
2. Reverse array order.
3. Return reversed array's strings with a space in between.
4. Remove the last space from the reversed string.


Code
----

=end

def reverse_sentence(string)
  output = ""
  string.split.reverse_each {|word| output += "#{word} "}
  output.chop
end

puts reverse_sentence("Reverse these words")

=begin
LS Solution
def reverse_sentence(string)
  string.split.reverse.join(' ')
end
=end