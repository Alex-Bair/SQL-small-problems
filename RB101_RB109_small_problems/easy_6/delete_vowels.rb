=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: array of strings
-  Output: array of input strings, but with vowels removed

---

**Problem Domain:**
Nothing particularly confusing.
---

**Implicit Requirements:**
- Array structure should be maintained (i.e. no elements should be deleted in they contain all vowels)
- Both capital and lowercase vowels should be deleted

---

**Clarifying Questions:**

1. Should the returned array be the same object as the input array, or different?
  - Assume it should return a new array.

---

**Mental Model:**

- Iterate over the array. Map to a new array.
  - Delete all vowels from each element

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

---

Data Structure
--------------

- Use arrays to store strings.

---

Algorithm
---------

- Transform input array:
  - Delete all capital and lowercase vowels from each element.
- Return new, transformed array.

Code
----

=end

VOWELS = %(AEIOUaeiou)

def remove_vowels(arr)
  arr.map { |string| string.delete(VOWELS)}
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

#Further Exploration

#Additional String methods that could achieve the same outcome are #gsub or #slice! (with regex) #each_char.replace