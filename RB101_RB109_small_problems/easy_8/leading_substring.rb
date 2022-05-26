=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: array of substrings the start at the beginning of the original string

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- Duplicate characters count.
- Array must be sorted from shortest to longest substring.
---

**Clarifying Questions:**

1. What should happen if an empty string is inputted?
  - Provide an empty array.

---

**Mental Model:**

Iterate along the string. Add current character to the substring. Add each substring to an empty array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

---

Data Structure
--------------

Use array to store substrings. Work with input string to create substrings.

---

Algorithm
---------

- Initialize an substring variable
- Initialize an empty array
- Iterate over the input string's characters
  - Add the current character to the substring variable.
  - Add the substring variable to an empty array.
- Return the array containing all substrings.

Code
----

=end

def leading_substrings(input_string)
  substring_arr = []
  substring = ""
  input_string.each_char do |char|
    substring << char
    substring_arr << substring.clone
  end
  substring_arr
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

#LS Solution using Integer#upto

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end