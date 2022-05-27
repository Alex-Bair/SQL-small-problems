=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: boolean (true if all alphabetic characters are uppercase, false if not)

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- non-alphabetic characters should not factor into boolean determination
- an empty string input should return true
- true of false should be returned, no truthy or falsy values
---

**Clarifying Questions:**

1. Should the input string be mutated?
  - No, do not mutate input string.

---

**Mental Model:**

Check if all characters are already uppercase in the input string. Output true if so, false otherwise.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

---

Data Structure
--------------

-Use strings for comparison

---

Algorithm
---------

- Uppercase entire string and save as a separate string uppercase_string
- If input string and uppercase_string are the same, return true. Else, return false.


Code
----

=end

def uppercase?(string)
  string == string.upcase
end

#Further Exploration
#Whether an empty string should return true or false (or an error message) is ultimately something that should be specified by the user/requirement provider. 
#In my mind, it makes more sense to return an error message (nothing doesn't have a case, so it can't be uppercase or not uppercase), but the user/requirement provider would have context on implementation & whether a true/false return value would be better.