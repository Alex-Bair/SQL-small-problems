=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: String containing one or more words
-  Output: Input string with words with character length greater than 5 reversed, meaning that the individual word's letters are reversed, not the sequence of words within the string

---

**Problem Domain:**
- Nothing specific. Reverse definition is clarified in examples given.
---

**Implicit Requirements:**

- Capitalization of input must be maintained
- Word sequence should be maintained.
- Letters within words should be reversed only if there are 5 or more letters
- Multiple sequential spaces should be reduced to a single space if between words.
- Multiple sequential spaces without any characters between them should be removed.

---

**Clarifying Questions:**

1. Will the input string ever have punctuation (ex: . , ! ? ), and if so, how should that be handled?
    Assume input string will not have any punctuation.

---

**Mental Model:**

Split provided string into individual strings. If an individual string length is 5 or greater, reverse that individual string. Join strings together into a single string. Return freshly compiled string.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs: 'Professional'
  -  Output: 'lanoissefoP'
-  Example 2
  -  Inputs: 'Walk around the block'
  -  Output: 'Walk dnuora the kcolb'

-  Example 3
  -  Inputs: 'Launch School'
  -  Output: 'hcnuaL loohcS'

---

_Your Test Cases:_

-  Example 3
  -  Inputs: 'Thats my nindo'
  -  Output: 'stahT my odnin'

---

Data Structure
--------------

Use arrays to store individual strings, work with arrays to modify strings, then join array elements back together.

---

Algorithm
---------

1. Split input string into array, delimiting by spaces.
2. Iterate over array to map into a new array.
  2.a. If string element length is 5 or greater, reverse the element order. Otherwise, do no alter the string element.
3. Join the array elements into a string with spaces between.

Code
----

=end

def reverse_words(input)
  
  rev_arr = input.split.collect {|word| word.length >= 5 ? word.reverse : word }
  rev_arr.join(" ")
  
end

puts reverse_words("Walk around the block")
puts reverse_words("Professional")
puts reverse_words("Launch School")
puts reverse_words("Thats my nindo")