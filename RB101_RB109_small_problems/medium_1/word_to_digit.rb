=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string with words separated by spaces
-  Output: same string as input but with the words repesenting numbers 0-9 replaced with the appropriate numbers

---

**Problem Domain:**
Nothing specific.
---

**Explicit Requirements:**
- Same string object must be returned. i.e. the input string must be modified
---


**Implicit Requirements:**
- Method must be named #word_to_digits
---

**Clarifying Questions:**

1. Should the input string be mutated?
  Yes.
---

**Mental Model:**

Use an array to convert the strings of words representing numbers 0-9 into the appropriate number. Use a mutating method to destructively mutate the input string.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

---

Data Structure
--------------
Have a conversion array such that the elements are the word versions of the corresponding index:
  %w(zero one two three four five six seven eight nine)
index 0   1    2    3    4    5    6    7    8     9

---

Algorithm
---------

- Create conversion array and assign to variable 'english_numbers'.
- Iterate through 'english_numbers' array
  - Perform destructive global substitution on the input string. If the current iteration element is detected, replace it with the index (as a string).
- Return the input string.


Code
----

=end

ENGLISH_NUMBERS = %w(zero one two three four five six seven eight nine)

def word_to_digit(str)
  ENGLISH_NUMBERS.each_with_index do |word, index|
    str.gsub!(/\b#{word}\b/, index.to_s)
  end
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'