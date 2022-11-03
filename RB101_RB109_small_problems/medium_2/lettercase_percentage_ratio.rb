=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: hash containing three entries
      1. percentage of characters in string that are lowercase
      2. percentage of characters in string that are uppercase
      3. percentage of characters in string that are neither lowercase nor uppercase

---

**Problem Domain:**
Nothing specific.
---

**Explicit Requirements:**
- Assume input string will always contain at least one character.
---


**Implicit Requirements:**
- Method name should be #letter_percentage
- The values should be floats with a single decimal point.
- Keys should be:
  :lowercase
  :uppercase
  :neither
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

Determine the size of the string. This will be the denominator for the percentage calculations.
Determine how many lowercase characters, how many uppercase characters, and how many characters that are neither.
Perform percentage calculations. Round to the nearest tenths decimal place.
Return information in hash format.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
---

Data Structure
--------------
Nothing complex. Use a hash to contain percentages.
---

Algorithm
---------



Code
----

=end

def letter_percentages(str)
  total_char_count = str.size.to_f
  uppercase_char_count = str.count('A-Z')
  lowercase_char_count = str.count('a-z')
  neither_char_count = total_char_count - uppercase_char_count - lowercase_char_count
  
  uppercase_percent = (uppercase_char_count / total_char_count) * 100
  lowercase_percent = (lowercase_char_count / total_char_count) * 100
  neither_percent = (neither_char_count / total_char_count) * 100
  
  {
    lowercase: lowercase_percent.round(1),
    uppercase: uppercase_percent.round(1),
    neither: neither_percent.round(1)
  }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')