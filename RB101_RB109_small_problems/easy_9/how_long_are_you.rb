=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: array containing word from every string plus an appended space and word length

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- Array must be returned.
- Array elements must be in the same order as they appear.
- An empty string should result in an empty array.
- Words are separated by spaces, and anything non-space is considered part of a word.
---

**Clarifying Questions:**

1. Should an input string of all spaces return an empty array?
  - Assume yes.

---

**Mental Model:**

Split input string into array of individual words. Create separate array of each words's length. 
Create a new array with sub-arrays containing each word and word length. Iterate through each sub-array to join the elements with a space.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

---

Data Structure
--------------

- Use arrays to manipulate data. Use nested arrays (ex: [[word1, word1_length], [word2, word2_length]])

---

Algorithm
---------

- Split input string into array of individual words. 
- Create separate array of each words's length. 
- Create a new array with sub-arrays containing each word and word length. 
- Transform each sub-array to join the sub-array elements with a space.


Code
----

=end

def word_lengths(string)
  words = string.split
  lengths = words.map(&:length)
  words_and_lengths = words.zip(lengths)
  words_and_lengths.map {|sub_array| sub_array.join(' ')}
end

