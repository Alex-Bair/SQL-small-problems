=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: string with every character doubled in the input string

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- Capitalization must be maintained.
- Any character (including spaces and non-alphanumerics) should be doubled.
- Doubled character should come immediately after original character.
---

**Clarifying Questions:**

1. None, examples make requirements clear.

---

**Mental Model:**

Iterate through input string's characters. Double each character and add it to a different string. Output string with doubled characters.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

---

Data Structure
--------------

- Use strings to store characters.

---

Algorithm
---------

- Initialize an doubled_characters variable with an empty string.
- Iterate along the input string's characters.
  - Double each character and add both characters to the doubled_characters string.
- Return the doubled_characters variable.

Code
----

=end

def repeater(input_string)
  doubled_characters = ""
  input_string.each_char do |char|
    doubled_characters << (char * 2)
  end
  doubled_characters
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''